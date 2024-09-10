<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

trait SaveFile
{
    protected function saveImage($file, $previousImagePath = '', $path = '',$table='',$id='')
    {
        if ($previousImagePath != '') {
            $image_path = $previousImagePath;
            if (File::exists($image_path)) {
                File::delete($image_path);
            }
        }
        
        if($path == ''){
            $image_name = time() . '.' . $file->extension();
            $file->move(public_path('images/'), $image_name);
        }else{
            $image_name = $table.time() . '.' . $file->extension();
            $file->move(public_path(''.$path.''), $image_name);
        }

        
        
        return $image_name;
    }
}
