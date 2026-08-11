<?php

namespace App\Http\Controllers;

use App\Models\Settings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MarketingSettingController extends Controller
{
    public function edit()
    {
        $this->ensureAdmin();

        return view('marketing.edit', ['settings' => Settings::firstOrFail()]);
    }

    public function update(Request $request)
    {
        $this->ensureAdmin();

        $validated = $request->validate([
            'meta_pixel_code' => ['nullable', 'string', 'max:200000'],
            'gtm_head_code' => ['nullable', 'string', 'max:200000'],
            'gtm_footer_code' => ['nullable', 'string', 'max:200000'],
            'google_analytics_code' => ['nullable', 'string', 'max:200000'],
            'custom_header_code' => ['nullable', 'string', 'max:200000'],
            'custom_footer_code' => ['nullable', 'string', 'max:200000'],
        ]);

        $settings = Settings::firstOrFail();
        foreach ($validated as $field => $value) {
            $settings->{$field} = $value;
        }
        $settings->save();

        return redirect()->route('marketing-settings.edit')
            ->with('success', 'Marketing tracking codes updated successfully.');
    }

    private function ensureAdmin(): void
    {
        abort_unless(Auth::check() && Auth::user()->user_type === 'admin', 403);
    }
}
