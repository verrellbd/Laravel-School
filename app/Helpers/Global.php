<?php

function ranking()
{
    $siswa = \App\Siswa::all();
    $siswa->map(function ($s) {
        $s->averageScore = $s->averageScore();
        return $s;
    });
    $siswa = $siswa->sortByDesc('averageScore');
    return $siswa;
}

function totalSiswa()
{
    return \App\Siswa::count();
}
function totalGuru()
{
    return \App\Guru::count();
}
