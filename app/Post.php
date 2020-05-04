<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{
    use Sluggable;
    protected $fillable = ['title', 'content', 'thumbnail', 'slug', 'user_id'];
    protected $date = ['created_at'];

    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function thumbnail()
    {
        return !$this->thumbnail ? asset('no-thumbnail.jpg') : $this->thumbnail;
    }
}
