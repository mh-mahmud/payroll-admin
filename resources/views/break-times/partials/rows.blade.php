
@forelse($breakTimes as $break)
<tr>
    <td class="fw-semibold">{{ $break->break_name }}</td>
    <td>{{ substr($break->start_time, 0, 5) }}</td>
    <td>{{ substr($break->end_time, 0, 5) }}</td>
    <td>{{ $break->duration_mins }} mins</td>
    <td>
        <span class="badge bg-light text-dark border">
            {{ $break->calculation_type_label }}
        </span>
    </td>
    <td class="text-end text-nowrap">
        <button type="button" class="btn btn-sm btn-light"
                onclick="viewBreakTime({{ $break->id }})"
                title="View">View</button>
        <button type="button" class="btn btn-sm btn-outline-primary"
                onclick="editBreakTime({{ $break->id }})"
                title="Edit">Edit</button>
        <button type="button" class="btn btn-sm btn-outline-danger"
                onclick="deleteBreakTime({{ $break->id }})"
                title="Delete">Delete</button>
    </td>
</tr>
@empty
<tr>
    <td colspan="6" class="text-center text-muted py-4">
        No break times found.
    </td>
</tr>
@endforelse

<style>
.bt-overlay {
    display: none;
    position: fixed;
    inset: 0;
    z-index: 2000;
    background: rgba(15, 23, 42, .32);
    align-items: center;
    justify-content: center;
    padding: 20px;
}
.bt-overlay.show { display: flex; }

.bt-modal {
    width: 100%;
    max-width: 650px;
    max-height: 90vh;
    overflow-y: auto;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 12px 36px rgba(0,0,0,.18);
}
.bt-modal-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 24px;
    border-bottom: 1px solid #e5e7eb;
}
.bt-modal-header h5 {
    margin: 0;
    font-size: 19px;
    font-weight: 600;
}
.bt-modal-body { padding: 24px; }
.bt-modal-footer {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    padding: 16px 24px;
    border-top: 1px solid #e5e7eb;
}
.bt-close {
    border: 0;
    background: transparent;
    color: #64748b;
    font-size: 28px;
    cursor: pointer;
    line-height: 1;
}
.bt-close:hover { color: #111827; }
.bt-modal .form-label { font-weight: 500; }
.bt-modal .form-control:focus,
.bt-modal .form-select:focus {
    border-color: #10b981;
    box-shadow: 0 0 0 .2rem rgba(16,185,129,.12);
}
@media(max-width: 576px) {
    .bt-overlay { padding: 10px; }
    .bt-modal-body { padding: 18px; }
    .bt-modal-header, .bt-modal-footer { padding: 16px 18px; }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('breakTimeForm');
    const formOverlay = document.getElementById('breakFormOverlay');
    const viewOverlay = document.getElementById('breakViewOverlay');
    const saveButton = document.getElementById('saveBreakBtn');
    const csrf = document.querySelector('meta[name="csrf-token"]').content;

    const baseUrl = @json(url('/break-times'));
    let editingId = null;

    function requestHeaders() {
        return {
            'X-CSRF-TOKEN': csrf,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        };
    }

    async function sendRequest(url, options = {}) {
        const response = await fetch(url, {
            ...options,
            headers: {
                ...requestHeaders(),
                ...(options.headers || {})
            }
        });

        const data = await response.json();

        if (!response.ok) {
            const error = new Error(data.message || 'Request failed.');
            error.status = response.status;
            error.data = data;
            throw error;
        }

        return data;
    }

    function openModal() {
        formOverlay.classList.add('show');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        formOverlay.classList.remove('show');
        document.body.style.overflow = '';
    }

    function closeViewModal() {
        viewOverlay.classList.remove('show');
        document.body.style.overflow = '';
    }

    function clearErrors() {
        form.querySelectorAll('.is-invalid').forEach(el => {
            el.classList.remove('is-invalid');
        });
        form.querySelectorAll('.invalid-feedback').forEach(el => {
            el.textContent = '';
        });
    }

    function showErrors(errors) {
        clearErrors();

        Object.entries(errors || {}).forEach(([field, messages]) => {
            const input = form.querySelector(`[name="${field}"]`);
            if (!input) return;

            input.classList.add('is-invalid');

            const feedback = input.parentElement.querySelector('.invalid-feedback');
            if (feedback) {
                feedback.textContent = messages[0] || 'Invalid value.';
            }
        });
    }

    function resetForm() {
        form.reset();
        clearErrors();
        editingId = null;
        document.getElementById('breakModalTitle').textContent = 'Add Break Time';
        saveButton.textContent = 'Save Break Time';
    }

    document.getElementById('addBreakBtn').addEventListener('click', () => {
        resetForm();
        openModal();
    });

    document.querySelectorAll('[data-close-break]').forEach(button => {
        button.addEventListener('click', () => {
            closeModal();
            closeViewModal();
        });
    });

    [formOverlay, viewOverlay].forEach(overlay => {
        overlay.addEventListener('click', event => {
            if (event.target === overlay) {
                overlay.classList.remove('show');
                document.body.style.overflow = '';
            }
        });
    });

    document.addEventListener('keydown', event => {
        if (event.key === 'Escape') {
            closeModal();
            closeViewModal();
        }
    });

    form.addEventListener('submit', async function (event) {
        event.preventDefault();
        clearErrors();

        saveButton.disabled = true;
        saveButton.textContent = 'Saving...';

        const payload = Object.fromEntries(new FormData(form).entries());

        try {
            const url = editingId ? `${baseUrl}/${editingId}` : baseUrl;
            const method = editingId ? 'PUT' : 'POST';

            const result = await sendRequest(url, {
                method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });

            closeModal();

            await Swal.fire({
                icon: 'success',
                title: 'Success',
                text: result.message,
                timer: 1800,
                showConfirmButton: false
            });

            window.location.reload();
        } catch (error) {
            if (error.status === 422 && error.data.errors) {
                showErrors(error.data.errors);
                return; // Keep the modal open.
            }

            console.error('Break time save failed:', error);

            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: error.data?.message || 'Unable to save break time.'
            });
        } finally {
            saveButton.disabled = false;
            saveButton.textContent = editingId ? 'Update Break Time' : 'Save Break Time';
        }
    });

    window.editBreakTime = async function (id) {
        resetForm();

        try {
            const result = await sendRequest(`${baseUrl}/${id}`);
            const item = result.data;

            editingId = item.id;
            form.elements.break_name.value = item.break_name;
            form.elements.start_time.value = String(item.start_time).slice(0, 5);
            form.elements.end_time.value = String(item.end_time).slice(0, 5);
            form.elements.duration_mins.value = item.duration_mins;
            form.elements.calculation_type.value = item.calculation_type;

            document.getElementById('breakModalTitle').textContent = 'Edit Break Time';
            saveButton.textContent = 'Update Break Time';
            openModal();
        } catch (error) {
            Swal.fire('Error', error.data?.message || 'Unable to load break time.', 'error');
        }
    };

    window.viewBreakTime = async function (id) {
        try {
            const result = await sendRequest(`${baseUrl}/${id}`);
            const item = result.data;
            const safe = value => String(value ?? '').replace(/[&<>"']/g, char => ({
                '&': '&amp;', '<': '&lt;', '>': '&gt;',
                '"': '&quot;', "'": '&#039;'
            })[char]);

            document.getElementById('breakDetailsBody').innerHTML = `
                <div class="row g-4">
                    <div class="col-sm-6">
                        <div class="text-muted small">Break Name</div>
                        <div class="fw-semibold">${safe(item.break_name)}</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-muted small">Calculation Type</div>
                        <div>${safe(result.calculation_type_label)}</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-muted small">Start Time</div>
                        <div>${safe(String(item.start_time).slice(0, 5))}</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-muted small">End Time</div>
                        <div>${safe(String(item.end_time).slice(0, 5))}</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-muted small">Duration</div>
                        <div>${safe(item.duration_mins)} minutes</div>
                    </div>
                </div>`;

            viewOverlay.classList.add('show');
            document.body.style.overflow = 'hidden';
        } catch (error) {
            Swal.fire('Error', error.data?.message || 'Unable to load details.', 'error');
        }
    };

    window.deleteBreakTime = async function (id) {
        const confirmation = await Swal.fire({
            title: 'Delete break time?',
            text: 'This action cannot be undone.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it',
            cancelButtonText: 'Cancel',
            confirmButtonColor: '#dc2626'
        });

        if (!confirmation.isConfirmed) return;

        try {
            const result = await sendRequest(`${baseUrl}/${id}`, {
                method: 'DELETE'
            });

            await Swal.fire({
                icon: 'success',
                title: 'Deleted',
                text: result.message,
                timer: 1600,
                showConfirmButton: false
            });

            window.location.reload();
        } catch (error) {
            Swal.fire('Error', error.data?.message || 'Unable to delete break time.', 'error');
        }
    };

    // Search using the existing index endpoint.
    let searchTimer;

    document.getElementById('breakSearch').addEventListener('input', function () {
        clearTimeout(searchTimer);

        searchTimer = setTimeout(async () => {
            try {
                const params = new URLSearchParams({ search: this.value });
                const result = await sendRequest(`${baseUrl}?${params}`);

                document.getElementById('breakTableBody').innerHTML = result.html;
                document.getElementById('breakPagination').innerHTML = result.pagination;
            } catch (error) {
                console.error('Break time search failed:', error);
            }
        }, 300);
    });
});
</script>
