@extends('layouts.master')

@section('content')
<meta name="csrf-token" content="{{ csrf_token() }}">

<!-- Assumes jQuery & jQuery UI are in your Master Layout -->
<style>
    /* Modern Page Layout */
    .page-container { padding: 22px 44px; background: #f8fafc; min-height: calc(100vh - 60px); }
    .page-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 18px; }
    .page-header h1 { margin: 0; font-size: 22px; color: #111827; }
    .page-header p { margin: 4px 0 0; font-size: 13px; color: #64748b; }
    
    .btn-add { border: none; background: #10b981; color: white; padding: 9px 15px; border-radius: 8px; font-weight: 600; cursor: pointer; }
    
    /* Clean Data Table */
    .table-wrapper { background: white; border: 1px solid #e2e8f0; border-radius: 11px; padding: 0; overflow: hidden; }
    .custom-table { width: 100%; border-collapse: collapse; font-size: 14px; }
    .custom-table th { background: #f8fafc; font-weight: 600; color: #475569; padding: 12px 15px; text-align: left; border-bottom: 1px solid #e2e8f0; }
    .custom-table td { padding: 12px 15px; border-bottom: 1px solid #f1f5f9; color: #334155; vertical-align: middle; }
    .custom-table tbody tr:hover { background: #f8fafc; }
    
    .link-name { color: #3b82f6; text-decoration: none; cursor: pointer; font-weight: 500; }
    .link-name:hover { text-decoration: underline; }
    
    .action-btn { background: none; border: none; cursor: pointer; font-size: 18px; padding: 4px; transition: 0.2s; }
    .action-edit { color: #10b981; }
    .action-delete { color: #ef4444; }
    .action-btn:hover { opacity: 0.7; transform: scale(1.1); }

    /* Modal Styles */
    .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(15,23,42,.45); z-index: 9999; align-items: center; justify-content: center; padding: 20px; }
    .modal-overlay.show { display: flex; }
    .modal-box { background: white; width: 1150px; max-width: 95%; max-height: 92vh; overflow-y: auto; border-radius: 12px; box-shadow: 0 20px 50px rgba(0,0,0,.2); }
    .modal-header { display: flex; justify-content: space-between; padding: 20px 22px; border-bottom: 1px solid #e5e7eb; }
    .modal-header h2 { margin: 0; font-size: 19px; }
    .modal-header p { margin: 4px 0 0; color: #64748b; font-size: 12px; }
    .modal-close { border: none; background: transparent; font-size: 27px; color: #64748b; cursor: pointer; }

    .modal-body { padding: 20px; }
    .modal-footer { display: flex; justify-content: flex-end; gap: 8px; padding: 15px 22px; border-top: 1px solid #e5e7eb; }
    .btn-cancel { border: 1px solid #dbe1e8; background: white; padding: 9px 16px; border-radius: 7px; cursor: pointer; }
    .btn-save { border: none; background: #10b981; color: white; padding: 9px 20px; border-radius: 7px; cursor: pointer; }

    /* Form inputs */
    .form-control { width: 100%; box-sizing: border-box; border: 1px solid #dbe1e8; border-radius: 7px; padding: 9px 11px; outline: none; font-size: 14px; }
    .form-control:focus { border-color: #10b981; }
    .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
    .form-group label { display: block; font-size: 13px; font-weight: 600; color: #334155; margin-bottom: 6px; }
    .required { color: #ef4444; }

    /* Left Panel & Grid */
    .tt-table th, .tt-table td { font-size: 13px; padding: 8px 10px; }
    .tt-table tbody tr { cursor: pointer; }
    .tt-table tbody tr:hover { background: #f1f5f9; }
    .grid-table th, .grid-table td { text-align: center; vertical-align: middle; min-width: 95px; padding: 4px; }
    .grid-input { width: 100%; border: 1px solid #dbe1e8; border-radius: 4px; padding: 5px; text-align: center; font-size: 12px; }
    .grid-input:focus { border-color: #10b981; outline: none; }
    .cell-filled { background: #fef3c7 !important; }
    .ui-autocomplete { z-index: 10000 !important; max-height: 200px; overflow-y: auto; }

    /* Toggle Switch (Auto Shift) */
    .switch { position: relative; display: inline-block; width: 44px; height: 24px; margin-bottom: 0; }
    .switch input { opacity: 0; width: 0; height: 0; }
    .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #cbd5e1; transition: .4s; border-radius: 24px; }
    .slider:before { position: absolute; content: ""; height: 18px; width: 18px; left: 3px; bottom: 3px; background-color: white; transition: .4s; border-radius: 50%; }
    input:checked + .slider { background-color: #10b981; }
    input:checked + .slider:before { transform: translateX(20px); }
</style>

<div class="page-container">
    <div class="page-header">
        <div>
            <h1>Shifts</h1>
            <p>Manage shift rosters and schedules.</p>
        </div>
        <button type="button" class="btn-add" onclick="openShiftModal()">
            + Add Shift
        </button>
    </div>

    <div class="table-wrapper">
        <table class="custom-table">
            <thead>
                <tr>
                    <th>Shift Name</th>
                    <th>Timetable</th>
                    <th>Unit</th>
                    <th>Cycle</th>
                    <th>Auto Shift</th>
                    <th>Weekly Overtime</th>
                    <th style="width: 100px; text-align: center;">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($shifts as $s)
                <tr>
                    <td>
                        <a class="link-name" onclick="editShift({{ $s->id }})">{{ $s->name }}</a>
                    </td>
                    <td>
                        @php
                            $uniqueTimetables = [];
                            if(is_array($s->schedule_data) || is_object($s->schedule_data)) {
                                foreach($s->schedule_data as $row) {
                                    foreach($row as $cell) {
                                        if(!empty($cell) && !in_array($cell, $uniqueTimetables)) {
                                            $uniqueTimetables[] = $cell;
                                        }
                                    }
                                }
                            }
                            echo implode(', ', array_slice($uniqueTimetables, 0, 3)); 
                            if(count($uniqueTimetables) > 3) echo '...';
                        @endphp
                    </td>
                    <td>{{ ucfirst($s->unit) }}</td>
                    <td>{{ $s->cycle }}</td>
                    <td>{{ $s->auto_shift ? 'Yes' : 'No' }}</td>
                    <td><span style="color:#ef4444; font-size: 18px; font-weight: bold;">⊖</span></td>
                    <td style="text-align: center;">
                        <button class="action-btn action-edit" onclick="editShift({{ $s->id }})" title="Edit">✎</button>
                        <button class="action-btn action-delete" onclick="deleteShift({{ $s->id }})" title="Delete">🗑</button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="7" style="text-align: center; padding: 30px; color: #64748b;">No shifts found.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    
    <div style="margin-top: 15px;">
        {{ $shifts->links() }}
    </div>
</div>

{{-- ADD / EDIT SHIFT MODAL --}}
<div class="modal-overlay" id="shiftModal">
    <div class="modal-box">
        <div class="modal-header">
            <div>
                <h2 id="modalTitle">Add Shift</h2>
                <p>Select the shift on the right side by choosing the timetable from the left side.</p>
            </div>
            <button type="button" class="modal-close" onclick="closeShiftModal()">×</button>
        </div>

        <div class="modal-body">
            <input type="hidden" id="shift_id" value="">

            <div class="form-row" style="margin-bottom: 20px;">
                <div class="form-group">
                    <label>Shift Name <span class="required">*</span></label>
                    <input type="text" id="shift_name" class="form-control" placeholder="Enter Shift Name">
                </div>
                <div class="form-group">
                    <label>Auto Shift</label>
                    <div style="display:flex; align-items:center; gap:10px; margin-top: 4px;">
                        <label class="switch">
                            <input type="checkbox" id="auto_shift_toggle">
                            <span class="slider"></span>
                        </label>
                        <span id="auto_shift_label" style="color:#64748b; font-size:13px;">Disable</span>
                    </div>
                </div>
            </div>

            <div class="row">
                {{-- LEFT PANEL --}}
                <div class="col-md-5 border-end" style="max-height: 520px; overflow-y: auto;">
                    <div style="position: relative; margin-bottom: 10px;">
                        <input type="text" id="leftSearch" class="form-control" placeholder="⌕ Timetable">
                    </div>
                    <table class="table table-sm table-bordered tt-table">
                        <thead style="position: sticky; top: 0; background: #f8fafc; z-index: 1;">
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Check-In</th>
                                <th>Check-Out</th>
                                <th>Break</th>
                            </tr>
                        </thead>
                        <tbody id="leftTimetableList">
                            @foreach($timetables as $tt)
                            <tr onclick="pickFromList('{{ $tt->name }}')">
                                <td><input type="checkbox" class="tt-checkbox"></td>
                                <td>{{ $tt->name }}</td>
                                <td>{{ $tt->check_in }}</td>
                                <td>{{ $tt->check_out }}</td>
                                <td>0</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                {{-- RIGHT PANEL --}}
                <div class="col-md-7">
                    <div class="form-row mb-3" style="background:#f8fafc;padding:10px;border-radius:8px;">
                        <div class="form-group mb-0">
                            <label>Unit*</label>
                            <select id="unitSelect" class="form-control">
                                <option value="day">Day</option>
                                <option value="week">Week</option>
                                <option value="month">Month</option>
                            </select>
                        </div>
                        <div class="form-group mb-0">
                            <label>Cycle*</label>
                            <input type="number" id="cycleInput" class="form-control" value="1" min="1" max="31">
                        </div>
                    </div>

                    <div class="table-responsive" style="max-height: 420px; overflow: auto; border: 1px solid #e2e8f0;">
                        <table class="table table-bordered grid-table" id="dynamicGrid" style="margin-bottom:0;">
                            <thead id="gridHead" style="position: sticky; top: 0; background: #f8fafc; z-index: 1;"></thead>
                            <tbody id="gridBody"></tbody>
                        </table>
                    </div>

                    <small style="color:#ef4444;display:block;margin-top:10px;">
                        * Notice: Select the shift on right side by choosing the timetable from the left side.
                    </small>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn-save" id="confirmRosterBtn">Confirm</button>
            <button type="button" class="btn-cancel" onclick="closeShiftModal()">Cancel</button>
        </div>
    </div>
</div>



@endsection

@section('endScript')
<!-- jQuery -->
<!-- <script src="{{url('/')}}/assets/js/jquery-3.6.0.min.js"></script> -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
    let activeInput = null;

    // Toggle Label Logic
    $('#auto_shift_toggle').on('change', function() {
        $('#auto_shift_label').text($(this).is(':checked') ? 'Enable' : 'Disable');
    });

    function openShiftModal() {
        $('#shift_id').val('');
        $('#modalTitle').text('Add Shift');
        $('#shift_name').val('');
        $('#unitSelect').val('day');
        $('#cycleInput').val(1);
        $('#auto_shift_toggle').prop('checked', false).trigger('change'); // Reset toggle
        generateGrid();
        $('#shiftModal').addClass('show');
    }

    function closeShiftModal() {
        $('#shiftModal').removeClass('show');
    }

    $('#shiftModal').on('click', function(e) {
        if (e.target === this) closeShiftModal();
    });

    // Edit Functionality
    function editShift(id) {
        $.ajax({
            url: "/shifts/" + id,
            method: 'GET',
            success: function(res) {
                let shift = res.data;
                
                $('#shift_id').val(shift.id);
                $('#modalTitle').text('Edit Shift');
                $('#shift_name').val(shift.name);
                $('#unitSelect').val(shift.unit);
                $('#cycleInput').val(shift.cycle);
                
                // Set Auto Shift Toggle
                $('#auto_shift_toggle').prop('checked', shift.auto_shift == 1).trigger('change');

                generateGrid();

                let schedule = shift.schedule_data;
                $('#gridBody tr').each(function(rowIndex) {
                    let $inputs = $(this).find('.grid-input');
                    $inputs.each(function(colIndex) {
                        let val = schedule[rowIndex] ? schedule[rowIndex][colIndex] : '';
                        if (val) {
                            $(this).val(val).addClass('cell-filled');
                        }
                    });
                });

                $('#shiftModal').addClass('show');
            },
            error: function() { alert("Unable to load shift details."); }
        });
    }

    // Autocomplete
    function initAutocomplete() {
        if ($(".grid-input").hasClass('ui-autocomplete-input')) {
            $(".grid-input").autocomplete("destroy");
        }

        $(".grid-input").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('timetables.search') }}",
                    dataType: "json",
                    data: { query: request.term },
                    success: function(data) {
                        response($.map(data, function(item) {
                            return { label: item.name, value: item.name };
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $(this).val(ui.item.value).addClass('cell-filled');
                return false;
            }
        });

        $(".grid-input").on('focus', function() { activeInput = this; });
    }

    // Generate Grid
    function generateGrid() {
        let unit  = $('#unitSelect').val();
        let cycle = parseInt($('#cycleInput').val()) || 1;
        let headHtml = '';
        let bodyHtml = '';

        if (unit === 'day') {
            headHtml = '<tr><th>Timetable</th></tr>';
            for (let r = 1; r <= cycle; r++) {
                bodyHtml += `<tr><td><input type="text" class="grid-input form-control" placeholder="Type or select..."></td></tr>`;
            }
        } else if (unit === 'week') {
            headHtml = '<tr><th>Cycle</th><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>';
            for (let r = 1; r <= cycle; r++) {
                bodyHtml += `<tr><td style="vertical-align:middle;">${r}</td>`;
                for (let c = 0; c < 7; c++) {
                    bodyHtml += `<td><input type="text" class="grid-input form-control" placeholder=""></td>`;
                }
                bodyHtml += `</tr>`;
            }
        } else if (unit === 'month') {
            headHtml = '<tr><th>Cycle</th>';
            for (let c = 1; c <= 30; c++) headHtml += `<th>${c}</th>`;
            headHtml += '</tr>';

            for (let r = 1; r <= cycle; r++) {
                bodyHtml += `<tr><td style="vertical-align:middle;">${r}</td>`;
                for (let c = 1; c <= 30; c++) {
                    bodyHtml += `<td><input type="text" class="grid-input form-control" placeholder=""></td>`;
                }
                bodyHtml += `</tr>`;
            }
        }

        $('#gridHead').html(headHtml);
        $('#gridBody').html(bodyHtml);
        initAutocomplete();
    }

    $('#unitSelect, #cycleInput').on('change input', function() {
        let c = parseInt($('#cycleInput').val());
        if (c < 1) $('#cycleInput').val(1);
        if (c > 31) $('#cycleInput').val(31);
        generateGrid();
    });

    // Left Panel
    function pickFromList(name) {
        if (activeInput) {
            $(activeInput).val(name).addClass('cell-filled');
        } else {
            alert("Please click an input box on the right side first.");
        }
    }

    $('#leftSearch').on('input', function() {
        let v = $(this).val().toLowerCase();
        $('#leftTimetableList tr').each(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(v) > -1);
        });
    });

    // Save / Update
    $('#confirmRosterBtn').on('click', function() {
        let shiftName = $('#shift_name').val().trim();
        if (!shiftName) return alert("Shift Name is required.");

        let schedule = [];
        $('#gridBody tr').each(function() {
            let row = [];
            $(this).find('input').each(function() { row.push($(this).val()); });
            schedule.push(row);
        });

        let $btn = $(this).prop('disabled', true).text('Saving...');

        $.ajax({
            url: "{{ route('shifts.store') }}",
            method: 'POST',
            contentType: 'application/json',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            data: JSON.stringify({
                id:          $('#shift_id').val() || null,
                name:        shiftName,
                unit:        $('#unitSelect').val(),
                cycle:       parseInt($('#cycleInput').val()),
                auto_shift:  $('#auto_shift_toggle').is(':checked') ? 1 : 0, // Send toggle state
                schedule:    schedule
            }),
            success: function(res) {
                if (res.success) {
                    alert(res.message);
                    closeShiftModal();
                    location.reload();
                }
            },
            error: function(xhr) {
                console.error(xhr.responseText);
                alert("Error saving shift.");
            },
            complete: function() {
                $btn.prop('disabled', false).text('Confirm');
            }
        });
    });

    // Delete
    function deleteShift(id) {
        if (!confirm("Delete this shift?")) return;
        $.ajax({
            url: "/shifts/" + id,
            method: 'DELETE',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            success: function() { location.reload(); }
        });
    }
</script>
@endsection