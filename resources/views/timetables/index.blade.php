@extends('layouts.master')

@section('content')
<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="container-fluid py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3>Timetable</h3>
            <p class="text-muted">Manage work schedules and attendance rules.</p>
        </div>
        <div class="d-flex gap-2">
            <button class="btn btn-success" id="createNormal">
                + Create Normal Timetable
            </button>
            <button class="btn btn-outline-success" id="createFlexible">
                + Create Flexible Timetable
            </button>
        </div>
    </div>

    <div class="card">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Work Time</th>
                    <th>Break Time</th>
                    <th>WorkDay</th>
                    <th>Work Type</th>
                    <th>Overtime</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @forelse($timetables as $item)
                    <tr>
                        {{--
                        <td>{{ $item->name }}</td>
                        <td>{{ ucfirst($item->type) }}</td>
                        <td>{{ substr($item->check_in, 0, 5) }}</td>
                        <td>{{ substr($item->check_out, 0, 5) }}</td>
                        <td>
                            {{ $item->breakTimes->sum('duration_mins') }} mins break
                        </td>
                        <td>{{ $item->work_day }} day(s)</td>
                        <td>{{ $item->work_hours_assign_to }}</td>
                        <td>{{ $item->overtime_enabled ? 'Enabled' : 'Disabled' }}</td>
                        <td class="text-nowrap">
                            <button class="btn btn-sm btn-outline-primary"
                                onclick="editTimetable({{ $item->id }})">
                                Edit
                            </button>
                            <button class="btn btn-sm btn-outline-danger"
                                onclick="deleteTimetable({{ $item->id }})">
                                Delete
                            </button>
                        </td>
                        --}}

                        <td>{{ $item->name }}</td>
                        <td>{{ ucfirst($item->type) }}</td>
                        <td>{{ substr($item->check_in, 0, 5) }}</td>
                        <td>{{ substr($item->check_out, 0, 5) }}</td>
                        <td>{{ $item->work_day }} day(s)</td>
                        <td>{{ $item->breakTimes->sum('duration_mins') }} mins</td>
                        <td>{{ $item->work_day }}</td>
                        <td>{{ $item->work_hours_assign_to }}</td>
                        <td>{{ $item->overtime_enabled ? 'Enabled' : 'Disabled' }}</td>
                        <td class="text-nowrap">
                            <button class="btn btn-sm btn-outline-primary"
                                onclick="editTimetable({{ $item->id }})">Edit</button>
                            <button class="btn btn-sm btn-outline-danger"
                                onclick="deleteTimetable({{ $item->id }})">Delete</button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="10" class="text-center py-4">
                            No timetables created yet.
                        </td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
        <div class="card-footer">{{ $timetables->links() }}</div>
    </div>
</div>

<div class="tt-overlay" id="ttOverlay">
    <div class="tt-modal">
        <div class="tt-header">
            <h5 id="ttTitle">Create Timetable</h5>
            <button type="button" class="tt-x" id="ttClose">&times;</button>
        </div>

        <form id="timetableForm">
            @csrf
            <input type="hidden" name="type" id="ttType" value="normal">

            <div class="tt-top-fields">
                <div class="tt-field">
                    <label>Name <span class="text-danger">*</span></label>
                    <input name="name" class="form-control" required>
                    <div class="invalid-feedback"></div>
                </div>
                <div class="tt-field">
                    <label>Work Hours Assign To <span class="text-danger">*</span></label>
                    <select name="work_hours_assign_to" class="form-select" required>
                        <option value="Regular">Regular</option>
                        <option value="Flexible">Flexible</option>
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
            </div>

            <div class="tt-tabs" role="tablist">
                <button type="button" class="tt-tab active" data-tab="basic">Basic Settings</button>
                <button type="button" class="tt-tab" data-tab="breaks">BreakTime Settings</button>
                <button type="button" class="tt-tab" data-tab="unscheduled">Unscheduled Time Settings</button>
                <button type="button" class="tt-tab" data-tab="overtime">Overtime Rule</button>
                <button type="button" class="tt-tab" data-tab="rules">Rule Settings</button>
            </div>

            <div class="tt-body">
                <!-- BASIC SETTINGS -->
                <section class="tt-panel active" id="panel-basic">
                    <div class="tt-grid">
                        <div class="tt-field">
                            <label>Check-In *</label>
                            <input type="time" name="check_in" class="form-control" required>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="tt-field">
                            <label>Check-Out *</label>
                            <input type="time" name="check_out" class="form-control" required>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="tt-field">
                            <label>Check-In Start Time *</label>
                            <div class="input-group">
                                <input type="time" name="check_in_start_time"
                                    class="form-control" required>
                                <span class="input-group-text">Cross</span>
                                <select name="check_in_start_days" class="form-select">
                                    @for($d = 0; $d <= 7; $d++)
                                        <option value="{{ $d }}">{{ $d }} day(s)</option>
                                    @endfor
                                </select>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="tt-field">
                            <label>Check-Out Start Time *</label>
                            <div class="input-group">
                                <input type="time" name="check_out_start_time"
                                    class="form-control" required>
                                <span class="input-group-text">Cross</span>
                                <select name="check_out_start_days" class="form-select">
                                    @for($d = 0; $d <= 7; $d++)
                                        <option value="{{ $d }}">{{ $d }} day(s)</option>
                                    @endfor
                                </select>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="tt-field">
                            <label>Check-In End Time *</label>
                            <div class="input-group">
                                <input type="time" name="check_in_end_time"
                                    class="form-control" required>
                                <span class="input-group-text">Cross</span>
                                <select name="check_in_end_days" class="form-select">
                                    @for($d = 0; $d <= 7; $d++)
                                        <option value="{{ $d }}">{{ $d }} day(s)</option>
                                    @endfor
                                </select>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="tt-field">
                            <label>Check-Out End Time *</label>
                            <div class="input-group">
                                <input type="time" name="check_out_end_time"
                                    class="form-control" required>
                                <span class="input-group-text">Cross</span>
                                <select name="check_out_end_days" class="form-select">
                                    @for($d = 0; $d <= 7; $d++)
                                        <option value="{{ $d }}">{{ $d }} day(s)</option>
                                    @endfor
                                </select>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="tt-field">
                            <label>WorkDay *</label>
                            <div class="input-group">
                                <input type="number" name="work_day" min="0" max="7"
                                    step="0.1" value="1.0" class="form-control" required>
                                <span class="input-group-text">Days</span>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="tt-field">
                            <label>Color Settings</label>
                            <input type="color" name="color" class="form-control form-control-color"
                                value="#78bd43">
                        </div>
                    </div>
                    <p class="small text-muted mt-3">
                        Notice: Cross-day settings are calculated relative to the timetable day.
                    </p>
                </section>

                <!-- BREAK TIME SETTINGS -->
                <section class="tt-panel" id="panel-breaks">
                    <p class="text-muted">Select the breaks that apply to this timetable.</p>

                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead>
                            <tr>
                                <th>Select</th>
                                <th>Break Name</th>
                                <th>Start Time</th>
                                <th>End Time</th>
                                <th>Duration</th>
                                <th>Calculation Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($breakTimes as $break)
                                <tr>
                                    <td>
                                        <input type="checkbox" name="break_time_ids[]"
                                            value="{{ $break->id }}"
                                            class="form-check-input">
                                    </td>
                                    <td>{{ $break->break_name }}</td>
                                    <td>{{ substr($break->start_time, 0, 5) }}</td>
                                    <td>{{ substr($break->end_time, 0, 5) }}</td>
                                    <td>{{ $break->duration_mins }} mins</td>
                                    <td>{{ $break->calculation_type_label }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center text-muted">
                                        No break times found. Create them under Shift &gt; Break Time first.
                                    </td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </section>

                <!-- UNSCHEDULED TIME SETTINGS -->
                <section class="tt-panel" id="panel-unscheduled">
                    <div class="alert alert-info">
                        The supplied screenshot shows this tab name but not its fields.
                        These settings are left unconfigured until you confirm the required
                        unscheduled-time rules.
                    </div>
                </section>

                <!-- OVERTIME RULE -->
                <section class="tt-panel" id="panel-overtime">
                    <div class="tt-grid mb-4">
                        <div class="tt-field">
                            <label>Max OT</label>
                            <select name="max_ot_enabled" class="form-select">
                                <option value="1">Enable</option>
                                <option value="0">Disable</option>
                            </select>
                        </div>
                        <div class="tt-field">
                            <label>Max OT Duration *</label>
                            <div class="input-group">
                                <input type="number" name="max_ot_duration" min="0"
                                    max="1440" value="240" class="form-control" required>
                                <span class="input-group-text">Minutes</span>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="tt-field">
                            <label>Overtime</label>
                            <select name="overtime_enabled" class="form-select">
                                <option value="1">Enable</option>
                                <option value="0">Disable</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead>
                            <tr>
                                <th>Work Hours Assign To</th>
                                <th>Minimum Work Hours</th>
                                <th>Maximum Work Hours</th>
                            </tr>
                            </thead>
                            <tbody>
                            @for($i = 0; $i < 3; $i++)
                                <tr>
                                    <td>
                                        <select name="overtime_rules[{{ $i }}][assign_to]"
                                            class="form-select">
                                            <option value="">Select...</option>
                                            <option value="Regular">Regular</option>
                                            <option value="Flexible">Flexible</option>
                                        </select>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" min="0" max="24" step="0.1"
                                                name="overtime_rules[{{ $i }}][min_hours]"
                                                class="form-control" value="0.0" required>
                                            <span class="input-group-text">Hours</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" min="0" max="24" step="0.1"
                                                name="overtime_rules[{{ $i }}][max_hours]"
                                                class="form-control" value="0.0" required>
                                            <span class="input-group-text">Hours</span>
                                        </div>
                                    </td>
                                </tr>
                            @endfor
                            </tbody>
                        </table>
                    </div>
                </section>

                <!-- RULE SETTINGS -->
                <section class="tt-panel" id="panel-rules">
                    <div class="tt-grid">
                        <div class="tt-field">
                            <label>Clock-In Is Required *</label>
                            <select name="clock_in_required" class="form-select">
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                        <div class="tt-field">
                            <label>Clock-Out Is Required *</label>
                            <select name="clock_out_required" class="form-select">
                                <option value="1">Yes</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                        <div class="tt-field">
                            <label>Allow Late-In *</label>
                            <div class="input-group">
                                <input type="number" name="allow_late_in" min="0"
                                    value="0" class="form-control" required>
                                <span class="input-group-text">Minutes</span>
                            </div>
                        </div>
                        <div class="tt-field">
                            <label>Allow Early-Out *</label>
                            <div class="input-group">
                                <input type="number" name="allow_early_out" min="0"
                                    value="0" class="form-control" required>
                                <span class="input-group-text">Minutes</span>
                            </div>
                        </div>
                        <div class="tt-field">
                            <label>Punch State Based *</label>
                            <select name="punch_state_based" class="form-select">
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>
                        <div class="tt-field">
                            <label>Day Change Time *</label>
                            <input type="time" name="day_change_time"
                                value="00:00" class="form-control" required>
                        </div>
                    </div>
                </section>
            </div>

            <div class="tt-footer">
                <button type="button" class="btn btn-light" id="ttCancel">Cancel</button>
                <button type="submit" class="btn btn-success" id="ttConfirm">Confirm</button>
            </div>
        </form>
    </div>
</div>
@endsection

<style>
.tt-overlay {
    display: none;
    position: fixed;
    inset: 0;
    z-index: 3000;
    background: rgba(0, 0, 0, .34);
    align-items: center;
    justify-content: center;
    padding: 20px;
}
.tt-overlay.show { display: flex; }

.tt-modal {
    width: min(100%, 900px);
    max-height: 90vh;
    background: #fff;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    box-shadow: 0 12px 35px rgba(0,0,0,.18);
}
.tt-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 20px;
    border-bottom: 1px solid #e5e7eb;
}
.tt-header h5 { margin: 0; font-size: 17px; }
.tt-x {
    border: 0;
    background: none;
    font-size: 27px;
    color: #64748b;
}
.tt-top-fields {
    padding: 16px 20px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}
.tt-field label {
    display: block;
    font-size: 12px;
    color: #475569;
    margin-bottom: 6px;
}
.tt-tabs {
    display: flex;
    flex-wrap: wrap;
    gap: 0;
    padding: 0 12px;
    border-bottom: 1px solid #dee2e6;
}
.tt-tab {
    border: 1px solid transparent;
    background: transparent;
    padding: 11px 12px;
    font-size: 13px;
    color: #475569;
}
.tt-tab.active {
    border-color: #dee2e6 #dee2e6 #fff;
    border-radius: 4px 4px 0 0;
    margin-bottom: -1px;
    color: #111827;
    background: white;
}
.tt-body {
    padding: 22px;
    overflow-y: auto;
    min-height: 270px;
}
.tt-panel { display: none; }
.tt-panel.active { display: block; }
.tt-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px 28px;
}
.tt-footer {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    padding: 15px 20px;
    border-top: 1px solid #e5e7eb;
}
.tt-field .form-control,
.tt-field .form-select {
    font-size: 13px;
}
.tt-field .invalid-feedback { font-size: 12px; }
@media(max-width: 700px) {
    .tt-overlay { padding: 8px; }
    .tt-top-fields, .tt-grid { grid-template-columns: 1fr; }
    .tt-tabs { padding: 0 5px; }
    .tt-tab { padding: 9px 7px; font-size: 11px; }
    .tt-body { padding: 15px; }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('timetableForm');
    const overlay = document.getElementById('ttOverlay');
    const confirmBtn = document.getElementById('ttConfirm');
    const baseUrl = @json(url('/timetables'));
    const csrf = document.querySelector('meta[name="csrf-token"]').content;

    let editingId = null;

    function openModal() {
        overlay.classList.add('show');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        overlay.classList.remove('show');
        document.body.style.overflow = '';
    }

    function clearErrors() {
        form.querySelectorAll('.is-invalid').forEach(el =>
            el.classList.remove('is-invalid')
        );
        form.querySelectorAll('.invalid-feedback').forEach(el =>
            el.textContent = ''
        );
    }

    function showErrors(errors) {
        clearErrors();

        for (const [field, messages] of Object.entries(errors || {})) {
            // Supports nested names like overtime_rules[0][min_hours].
            const input = [...form.elements].find(el => {
                if (!el.name) return false;
                const normalized = el.name.replace(/\[(\w+)\]/g, '.$1');
                return normalized === field;
            });

            if (!input) continue;

            input.classList.add('is-invalid');

            const wrapper = input.closest('.tt-field');
            const feedback = wrapper?.querySelector('.invalid-feedback');

            if (feedback) {
                feedback.textContent = messages[0] || 'Invalid value.';
            } else {
                input.insertAdjacentHTML(
                    'afterend',
                    '<div class="invalid-feedback d-block"></div>'
                );
                input.nextElementSibling.textContent = messages[0] || 'Invalid value.';
            }

            // Automatically open the tab containing the first invalid field.
            const panel = input.closest('.tt-panel');
            if (panel) activateTab(panel.id.replace('panel-', ''));
        }
    }

    function activateTab(tabName) {
        document.querySelectorAll('.tt-tab').forEach(tab => {
            tab.classList.toggle('active', tab.dataset.tab === tabName);
        });

        document.querySelectorAll('.tt-panel').forEach(panel => {
            panel.classList.toggle('active', panel.id === `panel-${tabName}`);
        });
    }

    document.querySelectorAll('.tt-tab').forEach(tab => {
        tab.addEventListener('click', () => activateTab(tab.dataset.tab));
    });

    function resetForm(type = 'normal') {
        form.reset();
        clearErrors();
        editingId = null;

        document.getElementById('ttType').value = type;
        document.getElementById('ttTitle').textContent =
            type === 'flexible'
                ? 'Create Flexible Timetable'
                : 'Create Normal Timetable';

        // Restore defaults after reset.
        form.elements.work_day.value = '1.0';
        form.elements.max_ot_duration.value = '240';
        form.elements.day_change_time.value = '00:00';

        activateTab('basic');
        confirmBtn.textContent = 'Confirm';
    }

    document.getElementById('createNormal').addEventListener('click', () => {
        resetForm('normal');
        openModal();
    });

    document.getElementById('createFlexible').addEventListener('click', () => {
        resetForm('flexible');
        openModal();
    });

    document.getElementById('ttClose').addEventListener('click', closeModal);
    document.getElementById('ttCancel').addEventListener('click', closeModal);

    overlay.addEventListener('click', event => {
        if (event.target === overlay) closeModal();
    });

    document.addEventListener('keydown', event => {
        if (event.key === 'Escape') closeModal();
    });

    async function api(url, options = {}) {
        const response = await fetch(url, {
            ...options,
            headers: {
                'X-CSRF-TOKEN': csrf,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
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

    form.addEventListener('submit', async event => {
        event.preventDefault();
        clearErrors();

        confirmBtn.disabled = true;
        confirmBtn.textContent = 'Saving...';

        try {
            const body = new FormData(form);

            // FormData includes CSRF token and preserves nested Laravel input names.
            if (editingId) body.append('_method', 'PUT');

            const url = editingId ? `${baseUrl}/${editingId}` : baseUrl;

            const result = await api(url, {
                method: 'POST',
                body
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
            if (error.status === 422 && error.data?.errors) {
                showErrors(error.data.errors);
                return; // Keep modal open for correction.
            }

            console.error('Timetable save failed:', error);

            Swal.fire({
                icon: 'error',
                title: 'Unable to save',
                text: error.data?.message || 'An unexpected error occurred.'
            });
        } finally {
            confirmBtn.disabled = false;
            confirmBtn.textContent = 'Confirm';
        }
    });

    window.editTimetable = async id => {
        resetForm();

        try {
            const result = await api(`${baseUrl}/${id}`);
            const item = result.data;

            editingId = item.id;
            document.getElementById('ttTitle').textContent = 'Edit Timetable';

            // Populate ordinary fields by name.
            Object.keys(item).forEach(key => {
                const field = form.elements.namedItem(key);
                if (!field || field instanceof RadioNodeList) return;
                if (['id', 'created_at', 'updated_at', 'break_times'].includes(key)) return;
                if (field.type === 'checkbox') field.checked = Boolean(item[key]);
                else if (item[key] !== null && item[key] !== undefined) {
                    field.value = String(item[key]).slice(0, 5);
                }
            });

            // Populate overtime rules by nested field name.
            (item.overtime_rules || []).forEach((rule, index) => {
                for (const key of ['assign_to', 'min_hours', 'max_hours']) {
                    const field = form.elements.namedItem(
                        `overtime_rules[${index}][${key}]`
                    );
                    if (field && rule[key] !== undefined) field.value = rule[key];
                }
            });

            const selectedIds = (result.break_time_ids || []).map(String);
            form.querySelectorAll('input[name="break_time_ids[]"]').forEach(box => {
                box.checked = selectedIds.includes(box.value);
            });

            activateTab('basic');
            openModal();
        } catch (error) {
            Swal.fire('Error', error.data?.message || 'Unable to load timetable.', 'error');
        }
    };

    window.deleteTimetable = async id => {
        const answer = await Swal.fire({
            title: 'Delete timetable?',
            text: 'This action cannot be undone.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            confirmButtonColor: '#dc2626'
        });

        if (!answer.isConfirmed) return;

        try {
            const result = await api(`${baseUrl}/${id}`, {
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
            Swal.fire('Error', error.data?.message || 'Unable to delete timetable.', 'error');
        }
    };
});
</script>
