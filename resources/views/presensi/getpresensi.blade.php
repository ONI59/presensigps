<?php
function selisih($jam_masuk, $jam_keluar)
{
    [$h, $m, $s] = explode(':', $jam_masuk);
    $dtAwal = mktime($h, $m, $s, 1, 1, 1);
    [$h, $m, $s] = explode(':', $jam_keluar);
    $dtAkhir = mktime($h, $m, $s, 1, 1, 1);
    $dtSelisih = $dtAkhir - $dtAwal;
    $totalmenit = $dtSelisih / 60;
    $jam = explode('.', $totalmenit / 60);
    $sisamenit = $totalmenit / 60 - $jam[0];
    $sisamenit2 = $sisamenit * 60;
    $jml_jam = $jam[0];
    return $jml_jam . ':' . round($sisamenit2);
}
?>

@foreach ($presensi as $d)
@php
    $status = strtolower(trim($d->status ?? ''));
    $foto_in = $d->foto_in ? Storage::url('uploads/absensi/' . $d->foto_in) : null;
    $foto_out = $d->foto_out ? Storage::url('uploads/absensi/' . $d->foto_out) : null;
@endphp

<tr>
    <td>{{ $loop->iteration }}</td>
    <td>{{ $d->nik }}</td>
    <td>{{ $d->nama_lengkap }}</td>
    <td>{{ $d->kode_cabang }}</td>
    <td>{{ $d->kode_dept }}</td>
    <td>
        {{ $d->nama_jam_kerja ?? '-' }}
        @if($d->jam_masuk && $d->jam_pulang)
            ({{ $d->jam_masuk }} s/d {{ $d->jam_pulang }})
        @endif
    </td>
    <td>{{ $d->jam_in ?? '-' }}</td>
    <td>
        @if ($foto_in)
            <img src="{{ $foto_in }}" class="avatar" alt="">
        @else
            <span class="badge bg-secondary">-</span>
        @endif
    </td>
    <td>
        {!! $d->jam_out ? $d->jam_out : '<span class="badge bg-danger">Belum Absen</span>' !!}
    </td>
    <td>
        @if ($foto_out)
            <img src="{{ $foto_out }}" class="avatar" alt="">
        @else
            <span class="badge bg-secondary">-</span>
        @endif
    </td>
    <td>
        @switch($status)
            @case('h')
                <span class="badge bg-success">H</span>
                @break
            @case('i')
                <span class="badge bg-warning">I</span>
                @break
            @case('s')
                <span class="badge bg-info">S</span>
                @break
            @case('a')
                <span class="badge bg-danger">A</span>
                @break
            @case('c')
                <span class="badge" style="background-color: #a600ff">C</span>
                @break
            @default
                <span class="badge bg-secondary">?</span>
        @endswitch
    </td>
    <td>
        @if ($status === 'h' && $d->jam_in && $d->jam_masuk)
            @if ($d->jam_in >= $d->jam_masuk)
                @php
                    $jamterlambat = selisih($d->jam_masuk, $d->jam_in);
                @endphp
                <span class="badge bg-danger">Terlambat {{ $jamterlambat }}</span>
            @else
                <span class="badge bg-success">Tepat Waktu</span>
            @endif
        @else
            <span class="badge bg-secondary">-</span>
        @endif
    </td>
    <td>
        @if ($d->lokasi_in)
            <a href="#" class="btn btn-primary btn-sm tampilkanpeta" id="{{ $d->id }}">🗺️</a>
        @endif
        <a href="#" class="btn btn-success btn-sm koreksipresensi" nik="{{ $d->nik }}">✏️</a>
    </td>
</tr>
@endforeach

<script>
    $(function() {
        $(".tampilkanpeta").click(function(e) {
            var id = $(this).attr("id");
            $.ajax({
                type: 'POST',
                url: '/tampilkanpeta',
                data: {
                    _token: "{{ csrf_token() }}",
                    id: id
                },
                cache: false,
                success: function(respond) {
                    $("#loadmap").html(respond);
                }
            });
            $("#modal-tampilkanpeta").modal("show");
        });

        $(".koreksipresensi").click(function(e) {
            var nik = $(this).attr("nik");
            var tanggal = "{{ $tanggal }}";
            $.ajax({
                type: 'POST',
                url: '/koreksipresensi',
                data: {
                    _token: "{{ csrf_token() }}",
                    nik: nik,
                    tanggal: tanggal
                },
                cache: false,
                success: function(respond) {
                    $("#loadkoreksipresensi").html(respond);
                }
            });
            $("#modal-koreksipresensi").modal("show");
        });
    });
</script>