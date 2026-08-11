@extends('layouts.master')

@section('content')

<!-- <div class="content d-flex flex-column flex-column-fluid" id="kt_content"> -->

<!--begin::Toolbar-->
<div class="toolbar" id="kt_toolbar">
    <!--begin::Container-->
    <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
        <!--begin::Page title-->
        <div data-kt-swapper="true" data-kt-swapper-mode="prepend"
            data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}"
            class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
            <!--begin::Title-->
            <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1">Settings Forms
                <!--begin::Separator-->
                <span class="h-20px border-gray-200 border-start ms-3 mx-2"></span>
                <!--end::Separator-->
                <!--begin::Description-->
                <small class="text-muted fs-7 fw-bold my-1 ms-1">Fill up the settings form</small>
                <!--end::Description-->
            </h1>
            <!--end::Title-->
        </div>
        <!--end::Page title-->
        <!--begin::Actions-->
        <div class="d-flex align-items-center py-1">
            <a href="{{ route('dashboard') }}" class="btn btn-sm btn-primary" id="kt_toolbar_primary_button">Dashboard</a>
            <!--end::Button-->
        </div>
        <!--end::Actions-->
    </div>
    <!--end::Container-->
</div>
<!--end::Toolbar-->

<!--**********************************
            Forms
***********************************-->
<div class="container-xxl">

    <!--Table Alert Message-->
    <!-- Display Success and Error Messages using SweetAlert2 -->
        @if (session('success'))
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: '{{ session('success')}}',
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
        @endif

        @if (session('error'))
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '{{ session('error')}}',
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
        @endif

    <!--End Table Alert Message-->


    <div class="row">
        <div class="col-xxl-12">
            <div class="card card-xxl-stretch mt-4">
                <!-- <div class="card card-xxl-stretch"> -->
                <div class="card-header bg-light bd-cyan">
                    <!--begin::Card title-->
                    <div class="card-title m-0">
                        <h3 class="fw-bolder m-0">App Settings</h3>
                    </div>
                    <!--end::Card title-->
                </div>

                <!-- Card Body-->
                <div class="card-body">

                    <!-- Start Form-->
                    <form class="g-form w-100" action="{{ route('save-app-settings') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <input type="hidden" name="id" value="{{ $data->id }}">
                        <div class="row">
                            <div class="col-12 mb-4">
                                <div class="border rounded p-4 bg-light">
                                    <h4 class="fw-bolder text-dark mb-3">Store Currency Conversion</h4>
                                    <label class="form-label fw-bolder text-dark">1 Malaysian Ringgit (MYR) = Bangladeshi Taka (BDT)</label>
                                    <div class="input-group" style="max-width: 520px;">
                                        <span class="input-group-text">1 MYR =</span>
                                        <input class="form-control form-control-sm form-control-solid" type="number"
                                            name="myr_to_bdt_rate" min="0.0001" max="99999999.9999" step="0.0001"
                                            value="{{ old('myr_to_bdt_rate', $data->myr_to_bdt_rate ?? 30.23) }}" required>
                                        <span class="input-group-text">BDT</span>
                                    </div>
                                    <div class="form-text">Bangladesh visitors see BDT. Visitors detected in any other country see MYR.</div>
                                    @error('myr_to_bdt_rate')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Facebook Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="facebook_link" value="{{ old('facebook_link', $data->facebook_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('facebook_link'))
                                    <span class="text-danger">{{ $errors->first('facebook_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Whats App Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="whats_app_link" value="{{ old('whats_app_link', $data->whats_app_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('whats_app_link'))
                                    <span class="text-danger">{{ $errors->first('whats_app_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Instagram Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="instagram_link" value="{{ old('instagram_link', $data->instagram_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('instagram_link'))
                                    <span class="text-danger">{{ $errors->first('instagram_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Youtube Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="youtube_link" value="{{ old('youtube_link', $data->youtube_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('youtube_link'))
                                    <span class="text-danger">{{ $errors->first('youtube_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Twitter Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="twitter_link" value="{{ old('twitter_link', $data->twitter_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('twitter_link'))
                                    <span class="text-danger">{{ $errors->first('twitter_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Linkedin Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="linkedin_link" value="{{ old('linkedin_link', $data->linkedin_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('linkedin_link'))
                                    <span class="text-danger">{{ $errors->first('linkedin_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label fw-bolder text-dark">TikTok Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="url" name="tiktok_link" value="{{ old('tiktok_link', $data->tiktok_link) }}" autocomplete="off" placeholder="https://www.tiktok.com/@username" />
                                    @error('tiktok_link')<span class="text-danger">{{ $message }}</span>@enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label fw-bolder text-dark">Pinterest Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="url" name="pinterest_link" value="{{ old('pinterest_link', $data->pinterest_link) }}" autocomplete="off" placeholder="https://www.pinterest.com/username" />
                                    @error('pinterest_link')<span class="text-danger">{{ $message }}</span>@enderror
                                </div>
                            </div>

                            <div class="col-12 mt-3 mb-3">
                                <div class="border rounded p-4 bg-light">
                                    <h4 class="fw-bolder text-dark mb-2">Floating Action Buttons</h4>
                                    <div class="form-text mb-4">Add a URL to show the button at the bottom-left of the storefront. Leave it empty to hide the button.</div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="form-label fw-bolder text-dark">WhatsApp Chat Link</label>
                                            <input class="form-control form-control-sm form-control-solid" type="url" name="whats_app_chat_link" value="{{ old('whats_app_chat_link', $data->whats_app_chat_link) }}" placeholder="https://wa.me/8801..." />
                                            @error('whats_app_chat_link')<span class="text-danger">{{ $message }}</span>@enderror
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-bolder text-dark">Messenger Link</label>
                                            <input class="form-control form-control-sm form-control-solid" type="url" name="messanger_link" value="{{ old('messanger_link', $data->messanger_link) }}" placeholder="https://m.me/username" />
                                            @error('messanger_link')<span class="text-danger">{{ $message }}</span>@enderror
                                        </div>
                                    </div>
                                </div>
                            </div>

                            {{--
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Messanger Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="messanger_link" value="{{ old('messanger_link', $data->messanger_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('messanger_link'))
                                    <span class="text-danger">{{ $errors->first('messanger_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Whats App Chat Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="whats_app_chat_link" value="{{ old('whats_app_chat_link', $data->whats_app_chat_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('whats_app_chat_link'))
                                    <span class="text-danger">{{ $errors->first('whats_app_chat_link') }}</span>
                                    @endif
                                </div>
                            </div>
                            --}}

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Google Map Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="google_map_link" value="{{ old('google_map_link', $data->google_map_link) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('google_map_link'))
                                    <span class="text-danger">{{ $errors->first('google_map_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Official Phone Number</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="office_phone_number" value="{{ old('office_phone_number', $data->office_phone_number) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('office_phone_number'))
                                    <span class="text-danger">{{ $errors->first('office_phone_number') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Phone Number 2</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="phone_number_2" value="{{ old('phone_number_2', $data->phone_number_2) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('phone_number_2'))
                                    <span class="text-danger">{{ $errors->first('phone_number_2') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Phone Number 3</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text" name="phone_number_3" value="{{ old('phone_number_3', $data->phone_number_3) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('phone_number_3'))
                                    <span class="text-danger">{{ $errors->first('phone_number_3') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Delivery Charge (Dhaka)</label>
                                    <input class="form-control form-control-sm form-control-solid" type="number" name="charge_inside_dhaka" value="{{ old('charge_inside_dhaka', $data->charge_inside_dhaka) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('charge_inside_dhaka'))
                                    <span class="text-danger">{{ $errors->first('charge_inside_dhaka') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <!--begin::Label-->
                                    <label class="form-label fw-bolder text-dark">Delivery Charge (Outside of Dhaka)</label>
                                    <input class="form-control form-control-sm form-control-solid" type="number" name="charge_outside_dhaka" value="{{ old('charge_outside_dhaka', $data->charge_outside_dhaka) }}" autocomplete="off" />
                                    <!--end::Input-->
                                    @if ($errors->has('charge_outside_dhaka'))
                                    <span class="text-danger">{{ $errors->first('charge_outside_dhaka') }}</span>
                                    @endif
                                </div>
                            </div>


                            {{--
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label  fw-bolder text-dark">product Image Upload</label>
                                    <input class="form-control form-control-sm form-control-solid" type="file" name="img_path" autocomplete="off" />

                                    @if ($data->img_path)
                                    <div class="mt-3" id="profile-image-container">
                                        <img src="{{ asset('uploads/products/' . $data->img_path) }}" alt="Image" width="100px">
                                        <button type="button" class="btn btn-danger btn-sm p-2" id="delete-profile-image">
                                            <i class="fas fa-trash-alt pe-0"></i>
                                        </button>
                                    </div>
                                    @else
                                        <img alt="Logo" src="{{ asset('uploads/noimage.jpg') }}" width="100px"/>
                                    @endif
                                </div>
                            </div>
                            --}}

                            <!-- images section -->
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label  fw-bolder text-dark">About Us</label>
                                    <input class="form-control form-control-sm form-control-solid js-settings-image-upload" type="file"
                                        name="about_us_img" data-field="about_us_img"
                                        accept="image/jpeg,image/png,image/gif,image/webp,image/avif" autocomplete="off" />
                                    <div class="form-text">ছবি select করলেই upload/update হবে। সর্বোচ্চ 5 MB।</div>
                                    <div class="settings-image-message mt-2" data-message-for="about_us_img"></div>

                                    @if ($data->about_us_img)
                                    <div class="mt-3" id="about-us-image-container">
                                        <img src="{{ \App\Support\MediaStorage::url($data->about_us_img, 'settings', '') }}" alt="Image" width="100px">
                                        <button type="button" class="btn btn-danger btn-sm p-2 js-delete-settings-image"
                                            data-field="about_us_img" data-container="about-us-image-container"
                                            aria-label="Delete About Us image">
                                            <i class="fas fa-trash-alt pe-0"></i>
                                        </button>
                                    </div>
                                    @else
                                        <img alt="Logo" src="{{ asset('uploads/noimage.jpg') }}" width="100px"/>
                                    @endif
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label  fw-bolder text-dark">Website Logo</label>
                                    <input class="form-control form-control-sm form-control-solid js-settings-image-upload" type="file"
                                        name="site_logo" data-field="site_logo"
                                        accept="image/jpeg,image/png,image/gif,image/webp,image/avif" autocomplete="off" />
                                    <div class="form-text">ছবি select করলেই upload/update হবে। সর্বোচ্চ 5 MB।</div>
                                    <div class="settings-image-message mt-2" data-message-for="site_logo"></div>

                                    @if ($data->site_logo)
                                    <div class="mt-3" id="profile-logo-container">
                                        <img src="{{ \App\Support\MediaStorage::url($data->site_logo, 'settings', '') }}" alt="Image" width="100px">
                                        <button type="button" class="btn btn-danger btn-sm p-2 js-delete-settings-image"
                                            data-field="site_logo" data-container="profile-logo-container"
                                            aria-label="Delete Website Logo">
                                            <i class="fas fa-trash-alt pe-0"></i>
                                        </button>
                                    </div>
                                    @else
                                        <img alt="Logo" src="{{ asset('uploads/noimage.jpg') }}" width="100px"/>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label fw-bolder text-dark">Website Favicon</label>
                                    <input class="form-control form-control-sm form-control-solid" type="file"
                                        name="favicon" accept=".ico,image/png,image/jpeg,image/gif,image/webp" autocomplete="off" />
                                    <div class="form-text">ICO, PNG, JPG, GIF or WebP; maximum 2 MB. Recommended: square image.</div>

                                    <div class="mt-3">
                                        <img src="{{ $data->favicon
                                            ? \App\Support\MediaStorage::url($data->favicon, 'settings', '')
                                            : asset('feb/img/favicon.ico') }}"
                                            alt="Website favicon" width="48" height="48" style="object-fit: contain;">
                                    </div>

                                    @error('favicon')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <h4 class="fw-bolder text-dark mb-3">App Promo Modal</h4>

                                    <input type="hidden" name="app_promo_enabled" value="0">
                                    <div class="form-check form-switch form-check-custom form-check-solid mb-4">
                                        <input class="form-check-input" type="checkbox" name="app_promo_enabled" value="1"
                                            id="app_promo_enabled"
                                            {{ old('app_promo_enabled', $data->app_promo_enabled ?? true) ? 'checked' : '' }}>
                                        <label class="form-check-label fw-bold text-dark" for="app_promo_enabled">
                                            Show App Promo Modal
                                        </label>
                                    </div>
                                    @error('app_promo_enabled')
                                        <span class="text-danger d-block mb-2">{{ $message }}</span>
                                    @enderror

                                    <label class="form-label fw-bolder text-dark">Promo Image Upload</label>
                                    <input class="form-control form-control-sm form-control-solid" type="file"
                                        name="app_promo_image" accept="image/jpeg,image/png,image/gif,image/webp,image/avif"
                                        autocomplete="off" />
                                    <div class="form-text">Maximum file size: 5 MB.</div>

                                    <label class="form-label fw-bolder text-dark mt-3">App Promo Link</label>
                                    <input class="form-control form-control-sm form-control-solid" type="text"
                                        name="app_promo_link" value="{{ old('app_promo_link', $data->app_promo_link) }}"
                                        placeholder="/shop or https://example.com" autocomplete="off" />
                                    <div class="form-text">Use an internal path starting with / or a full http(s) URL.</div>

                                    @error('app_promo_link')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror

                                    @if ($data->app_promo_image)
                                        <div class="mt-3">
                                            <img src="{{ \App\Support\MediaStorage::url($data->app_promo_image, 'settings', '') }}"
                                                alt="App promo modal image" style="max-width: 220px; max-height: 220px; object-fit: contain;">
                                        </div>
                                    @else
                                        <div class="mt-3">
                                            <img src="{{ asset('feb/image-gallery/6a203def13e1a-square.jpeg') }}"
                                                alt="Default app promo modal image" style="max-width: 220px; max-height: 220px; object-fit: contain;">
                                            <div class="form-text">Currently using the default image.</div>
                                        </div>
                                    @endif

                                    @error('app_promo_image')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label  fw-bolder text-dark">Privacy Policy</label>
                                    <input class="form-control form-control-sm form-control-solid js-settings-image-upload" type="file" name="sidebar_image_01" data-field="sidebar_image_01" accept="image/jpeg,image/png,image/gif,image/webp,image/avif" autocomplete="off" />
                                    <div class="form-text">ছবি select করলেই upload/update হবে। সর্বোচ্চ 5 MB।</div>
                                    <div class="settings-image-message mt-2" data-message-for="sidebar_image_01"></div>

                                    @if ($data->sidebar_image_01)
                                    <div class="mt-3" id="privacy-policy-image-container">
                                        <img src="{{ \App\Support\MediaStorage::url($data->sidebar_image_01, 'settings', '') }}" alt="Image" width="100px">
                                        <button type="button" class="btn btn-danger btn-sm p-2 js-delete-settings-image"
                                            data-field="sidebar_image_01" data-container="privacy-policy-image-container"
                                            aria-label="Delete Privacy Policy image">
                                            <i class="fas fa-trash-alt pe-0"></i>
                                        </button>
                                    </div>
                                    @else
                                        <img alt="Logo" src="{{ asset('uploads/noimage.jpg') }}" width="100px"/>
                                    @endif
                                    @error('sidebar_image_01')<span class="text-danger d-block">{{ $message }}</span>@enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label  fw-bolder text-dark">Terms & Conditions</label>
                                    <input class="form-control form-control-sm form-control-solid js-settings-image-upload" type="file" name="sidebar_image_02" data-field="sidebar_image_02" accept="image/jpeg,image/png,image/gif,image/webp,image/avif" autocomplete="off" />
                                    <div class="form-text">ছবি select করলেই upload/update হবে। সর্বোচ্চ 5 MB।</div>
                                    <div class="settings-image-message mt-2" data-message-for="sidebar_image_02"></div>

                                    @if ($data->sidebar_image_02)
                                    <div class="mt-3" id="terms-conditions-image-container">
                                        <img src="{{ \App\Support\MediaStorage::url($data->sidebar_image_02, 'settings', '') }}" alt="Image" width="100px">
                                        <button type="button" class="btn btn-danger btn-sm p-2 js-delete-settings-image"
                                            data-field="sidebar_image_02" data-container="terms-conditions-image-container"
                                            aria-label="Delete Terms and Conditions image">
                                            <i class="fas fa-trash-alt pe-0"></i>
                                        </button>
                                    </div>
                                    @else
                                        <img alt="Logo" src="{{ asset('uploads/noimage.jpg') }}" width="100px"/>
                                    @endif
                                    @error('sidebar_image_02')<span class="text-danger d-block">{{ $message }}</span>@enderror
                                </div>
                            </div>


                            {{--
                            <div class="col-md-6">
                                <div class="fv-row mb-3">
                                    <label class="form-label fw-bolder text-dark">Stock Status</label>
                                    <select class=" form-control form-control-sm form-control-solid" name="stock_status" aria-label="Default select example">

                                        <option value="">-- select one --</option>
                                        <option value="In Stock" {{ ($data->stock_status == 'In Stock') ? 'selected' : '' }}>In Stock</option>
                                        <option value="Out of Stock" {{ ($data->stock_status == 'Out of Stock') ? 'selected' : '' }}>Out of Stock</option>
                                        <option value="Limit Out" {{ ($data->stock_status == 'Limit Out') ? 'selected' : '' }}>Limit Out</option>

                                    </select>
                                </div>
                            </div>
                            --}}


                           <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">About Us</label>
                                    <textarea
                                        class="form-control form-control-sm  form-control-solid editor" name="about_us" rows="3">{{ $data->about_us }}</textarea>
                                    @if ($errors->has('about_us'))
                                        <span class="text-danger">{{ $errors->first('about_us') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">Contact Address</label>
                                    <textarea class="form-control form-control-sm  form-control-solid editor" name="contact_address" rows="3">{{ $data->contact_address }}</textarea>
                                    @if ($errors->has('contact_address'))
                                        <span class="text-danger">{{ $errors->first('contact_address') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">Return Policy</label>
                                    <textarea
                                        class="form-control form-control-sm  form-control-solid editor" name="return_policy"
                                        rows="3">{{ $data->return_policy }}</textarea>
                                    @if ($errors->has('return_policy'))
                                        <span class="text-danger">
                                            {{ $errors->first('return_policy') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">Terms & Conditions</label>
                                    <textarea
                                        class="form-control form-control-sm  form-control-solid editor" name="terms_and_conditions"
                                        rows="3">{{ $data->terms_and_conditions }}</textarea>
                                    @if ($errors->has('terms_and_conditions'))
                                        <span class="text-danger">
                                            {{ $errors->first('terms_and_conditions') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">Footer Message</label>
                                    <textarea
                                        class="form-control form-control-sm  form-control-solid editor" name="footer_message"
                                        rows="3">{{ $data->footer_message }}</textarea>
                                    @if ($errors->has('footer_message'))
                                        <span class="text-danger">
                                            {{ $errors->first('footer_message') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark" for="textarea">FAQ</label>
                                    <textarea
                                        class="form-control form-control-sm  form-control-solid editor" name="faq"
                                        rows="3">{{ $data->faq }}</textarea>
                                    @if ($errors->has('faq'))
                                        <span class="text-danger">
                                            {{ $errors->first('faq') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-12 mt-6">
                                <div class="border rounded p-4 bg-light">
                                    <h4 class="fw-bolder text-dark mb-2">Footer Content Pages</h4>
                                    <div class="form-text">These contents are displayed on the storefront Size Guide, Privacy Policy and Cookie Policy pages.</div>
                                </div>
                            </div>

                            <div class="col-md-6 mt-4">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark">Size Guide</label>
                                    <textarea class="form-control form-control-sm form-control-solid editor" name="size_guide" rows="7">{{ old('size_guide', $data->size_guide) }}</textarea>
                                    @error('size_guide')<span class="text-danger">{{ $message }}</span>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 mt-4">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark">Privacy Policy</label>
                                    <textarea class="form-control form-control-sm form-control-solid editor" name="privacy_policy" rows="7">{{ old('privacy_policy', $data->privacy_policy) }}</textarea>
                                    @error('privacy_policy')<span class="text-danger">{{ $message }}</span>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 mt-4">
                                <div class="form-group">
                                    <label class="form-label fw-bolder text-dark">Cookie Policy</label>
                                    <textarea class="form-control form-control-sm form-control-solid editor" name="cookie_policy" rows="7">{{ old('cookie_policy', $data->cookie_policy) }}</textarea>
                                    @error('cookie_policy')<span class="text-danger">{{ $message }}</span>@enderror
                                </div>
                            </div>

                        </div>
                        <!--End Row-->
                        <div class="card-footer d-flex justify-content-end py-6 px-9">
                            <button type="submit" class="btn btn-primary" id="kt_account_profile_details_submit">Update Settings</button>
                        </div>

                    </form>

                    <!-- End Form-->

                </div>
                <!--End Card body-->

                <!--begin::Actions-->

                <!--end::Actions-->
            </div>
        </div>
    </div>
</div>
<!-- End Forms-->


<!-- </div> -->
<!--end::Content-->


    {{--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#delete-profile-image').click(function() {
            if (confirm('Are you sure you want to delete your product image?')) {
                $.ajax({
                    url: '{{ route('update-product-image', $data->id) }}', // Using the correct route
                    type: 'PUT', // Correct HTTP method
                    data: {
                        _token: '{{ csrf_token() }}' // Include CSRF token
                    },
                    success: function(response) {
                        if (response.success) {
                            $('#profile-image-container').remove();
                           // alert('Profile image deleted successfully');
                        } else {
                            alert('Error deleting product image');
                        }
                    },
                    error: function() {
                        alert('Error deleting product image');
                    }
                });
            }
        });
    });
    </script>--}}

@endsection
@section('endScript')
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            var summernoteElement = document.querySelectorAll('.editor');
            var resetButton = document.getElementById('resetButton');
            if (resetButton) {
                resetButton.addEventListener('click', function() {
                    $(summernoteElement).summernote('code', '');
                });
            }

            document.querySelectorAll('.js-delete-settings-image').forEach(function (button) {
                button.addEventListener('click', async function () {
                    if (!confirm('Are you sure you want to delete this image?')) return;

                    button.disabled = true;
                    var url = @json(route('app-settings.image.delete', ['field' => '__FIELD__']))
                        .replace('__FIELD__', encodeURIComponent(button.dataset.field));

                    try {
                        var response = await fetch(url, {
                            method: 'DELETE',
                            headers: {
                                'X-CSRF-TOKEN': @json(csrf_token()),
                                'Accept': 'application/json'
                            }
                        });
                        var result = await response.json();
                        if (!response.ok || !result.success) throw new Error(result.message || 'Unable to delete image.');
                        window.location.reload();
                    } catch (error) {
                        alert(error.message || 'Unable to delete image.');
                        button.disabled = false;
                    }
                });
            });

            document.querySelectorAll('.js-settings-image-upload').forEach(function (input) {
                input.addEventListener('change', async function () {
                    if (!input.files.length) return;

                    var message = document.querySelector('[data-message-for="' + input.dataset.field + '"]');
                    var formData = new FormData();
                    formData.append('image', input.files[0]);
                    formData.append('_token', @json(csrf_token()));
                    input.disabled = true;
                    message.className = 'settings-image-message mt-2 text-primary';
                    message.textContent = 'Uploading...';

                    var url = @json(route('app-settings.image.update', ['field' => '__FIELD__']))
                        .replace('__FIELD__', encodeURIComponent(input.dataset.field));

                    try {
                        var response = await fetch(url, {
                            method: 'POST',
                            headers: {'Accept': 'application/json'},
                            body: formData
                        });
                        var result = await response.json();
                        if (!response.ok || !result.success) {
                            var validationMessage = result.errors?.image?.[0];
                            throw new Error(validationMessage || result.message || 'Unable to update image.');
                        }
                        message.className = 'settings-image-message mt-2 text-success';
                        message.textContent = result.message;
                        window.location.reload();
                    } catch (error) {
                        message.className = 'settings-image-message mt-2 text-danger';
                        message.textContent = error.message || 'Unable to update image.';
                        input.disabled = false;
                    }
                });
            });
        });
    </script>
@endsection
