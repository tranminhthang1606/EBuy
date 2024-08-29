<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class createViewFile extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:adminview {view}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'create a new view file';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $viewname = $this->argument('view');

        $viewname = $viewname . '.blade.php';

        $pathname = "resources/views/{$viewname}";

        if (File::exists($pathname)) {
            $this->error("file {$pathname} is already exist ");
            return;
        }
        $dir = dirname($pathname);
        if (!file_exists($dir)) {
            mkdir($dir, 0777, true);
        }

        $content = '@extends("admin.layout")
        @section("content")
        <div class="page-wrapper">
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">User Profile</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">User Profilep</li>
                    </ol>
                </nav>
            </div>
            <div class="ms-auto">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">Settings</button>
                    <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split"
                        data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> <a class="dropdown-item"
                            href="javascript:;">Action</a>
                        <a class="dropdown-item" href="javascript:;">Another action</a>
                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                        <div class="dropdown-divider"></div> <a class="dropdown-item" href="javascript:;">Separated
                            link</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
@endsection
        ';

        File::put($pathname, $content);

        $this->info("File {$pathname} is created");
    }
}
