<?php

use App\Http\Controllers\AcademicController;
use App\Http\Controllers\AcademicDegreeController;
use App\Http\Controllers\AcadmicSpaceController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\ExportController;
use App\Http\Controllers\HallController;
use App\Http\Controllers\LapController;
use App\Http\Controllers\LecturerController;
use App\Http\Controllers\ManagementRoleController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\ScheduleExportController;
use App\Http\Controllers\ScriptController;
use App\Http\Controllers\StudyPlaneController;
use App\Http\Controllers\TermPlansController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/




Route::controller(AuthController::class)->group(function () {
    
    // 🔹 تسجيل الدخول
    Route::post('/login', 'login');

    // 🔹 العمليات المحمية (تحتاج توكين)
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', 'getUser');  // جلب بيانات المستخدم الحالي
        Route::post('/register', 'register'); // تسجيل مستخدم جديد (Admin فقط)
        Route::post('/logout', 'logout'); // تسجيل الخروج
    });

});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});




        Route::resource('/departments', DepartmentController::class);


    Route::resource('/lecturers', LecturerController::class);
    
    
    
    Route::resource('/academics', AcademicController::class);
    
    Route::post('/academics/add-course', [AcademicController::class, 'AddCourse'])
    ->middleware('can:add course to academic');
    
    Route::delete('/academics/remove-course/{id}', [AcademicController::class, 'RemoveCourse'])
    ->middleware('can:remove course from academic');
    
    Route::resource('/study-plans', StudyPlaneController::class);
    

    
    Route::get('/term-plans/show-item/{id}', [TermPlansController::class, 'ShowItem'])
    ->middleware('can:show term plan item');

    Route::post('/roles/assign' , [ManagementRoleController::class , 'assignRole'] )
    ->middleware('can:assign role');
    Route::post('/roles/remove' , [ManagementRoleController::class , 'removeRole'] )
    ->middleware('can:remove role');

    Route::post('/permission/give', [ManagementRoleController::class, 'assignPermission'])
    ->middleware('can:assign permission');

    Route::post('/permission/update', [ManagementRoleController::class, 'updatePermission'])
    ->middleware('can:remove permission');

    Route::resource('/halls' , HallController::class);
    Route::resource('/laps' , LapController::class);
    Route::get('/get-lecturers-ByType', [LecturerController::class, 'getStaffByType']);
    Route::get('/academic-degrees', [AcademicDegreeController::class, 'index']);

   
    Route::resource('/schedules' , ScheduleController::class);
    Route::get('/schedule/{id}/export-pdf', [ExportController::class, 'exportPdf']);
Route::get('/schedule/{id}/preview', [ExportController::class, 'previewSchedule']);


Route::post('/script/run', [ScriptController::class, 'run']);




    // روابط تصدير الجدول الكامل
    Route::get('/schedule/export/schedule/{id}/pdf', [ScheduleExportController::class, 'exportPdfSchedule'])
        ->name('export.schedule.pdf');
    Route::get('/schedule/export/schedule/{id}/excel', [ScheduleExportController::class, 'exportExcelSchedule'])
        ->name('export.schedule.excel');
    
    // روابط تصدير جدول المحاضرين
    Route::get('/schedule/export/lecturer/{id}/pdf', [ScheduleExportController::class, 'exportPdfLecturer'])
        ->name('export.lecturer.pdf');
    Route::get('/schedule/export/lecturer/{id}/excel', [ScheduleExportController::class, 'exportExcelLecturer'])
        ->name('export.lecturer.excel');
    
    // روابط تصدير جدول القاعات
    Route::get('/schedule/export/hall/{id}/pdf', [ScheduleExportController::class, 'exportPdfHall'])
        ->name('export.hall.pdf');
    Route::get('/schedule/export/hall/{id}/excel', [ScheduleExportController::class, 'exportExcelHall'])
        ->name('export.hall.excel');
    
    // روابط تصدير جدول المعامل
    Route::get('/schedule/export/lab/{id}/pdf', [ScheduleExportController::class, 'exportPdfLab'])
        ->name('export.lab.pdf');
    Route::get('/schedule/export/lab/{id}/excel', [ScheduleExportController::class, 'exportExcelLab'])
        ->name('export.lab.excel');
    
    // روابط تصدير جدول الأقسام
    Route::get('/schedule/export/department/{id}/pdf', [ScheduleExportController::class, 'exportPdfDepartment'])
        ->name('export.department.pdf');
    Route::get('/schedule/export/department/{id}/excel', [ScheduleExportController::class, 'exportExcelDepartment'])
        ->name('export.department.excel');