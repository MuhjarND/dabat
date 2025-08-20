@extends('layouts.app')

@section('content')
<div class="container">
    <h3>Tambah Pejabat</h3>
    <form action="{{ route('employees.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label>Nama <span class="text-danger">*</span></label>
            <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
            @error('name') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Jabatan</label>
            <input type="text" name="position" class="form-control" value="{{ old('position') }}">
            @error('position') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Kategori Jabatan <span class="text-danger">*</span></label>
                <select name="category" class="form-control">
                    <option value="Pimpinan">Pimpinan</option>
                    <option value="Hakim Tinggi">Hakim Tinggi</option>
                    <option value="Sekretaris dan Panitera">Sekretaris dan Panitera</option>
                    <option value="Kepala Bagian">Kepala Bagian</option>
                    <option value="Panitera Muda">Panitera Muda</option>
                    <option value="Kepala Sub Bagian">Kepala Sub Bagian</option>
                    <option value="Panitera Pengganti">Panitera Pengganti</option>
                </select>
            @error('category') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <div class="form-group">
            <label>Foto (maks 2MB)</label>
            <input type="file" name="photo" class="form-control-file">
            @error('photo') <div class="text-danger small">{{ $message }}</div> @enderror
        </div>
        <button class="btn btn-primary">Simpan</button>
        <a href="{{ route('employees.index') }}" class="btn btn-secondary">Batal</a>
    </form>
</div>
@endsection
