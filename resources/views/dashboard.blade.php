@extends('layouts.app')

@section('content')
<div class="container">
    <h3>Dashboard Operator</h3>
    <p>Ubah status kehadiran pejabat dengan cepat.</p>

    <table class="table table-bordered table-striped">
        <thead class="thead-light" >
            <tr class="text-center">
                <th>Foto</th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>Kategori</th>
                <th>Status</th>
                <th style="min-width: 130px">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employees as $emp)
            @php
                $icons = [
                    'Pimpinan'        => 'fa-user-tie',
                    'HakimTinggi'    => 'fa-scale-balanced',
                    'Kesekretariatan' => 'fa-folder-open',
                    'Kepaniteraan'    => 'fa-book',
                ];
                $icon = $icons[$emp->category] ?? 'fa-user';
            @endphp
            <tr id="row-{{ $emp->id }}">
                <td>@if($emp->photo)<img src="{{ asset('uploads') }}/{{ $emp->photo }}" width="60">@endif</td>
                <td>{{ $emp->name }}</td>
                <td>{{ $emp->position }}</td>
                <td>{{ $emp->category }}</td>
                <td>
                    <span class="badge badge-{{ $emp->status == 'ada' ? 'success' : 'danger' }}" id="status-{{ $emp->id }}">
                        {{ $emp->status == 'ada' ? 'ADA' : 'KELUAR' }}
                    </span>
                </td>
                <td>
                    <button class="btn btn-sm btn-success" onclick="updateStatus({{ $emp->id }}, 'ada')">Ada</button>
                    <button class="btn btn-sm btn-danger" onclick="updateStatus({{ $emp->id }}, 'tidak_ada')">Keluar</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection

@push('scripts')
<script>
function updateStatus(id, status) {
    $.post("{{ route('status.update') }}", {
        _token: $('meta[name="csrf-token"]').attr('content'),
        employee_id: id,
        status: status
    }, function(res) {
        if (res.success) {
            const badge = $('#status-' + id);
            badge.removeClass('badge-success badge-danger')
                 .addClass(status === 'ada' ? 'badge-success' : 'badge-danger')
                 .text(status.toUpperCase());
        }
    });
}
</script>
@endpush
