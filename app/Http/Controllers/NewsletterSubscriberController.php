<?php

namespace App\Http\Controllers;

use App\Models\NewsletterSubscriber;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class NewsletterSubscriberController extends Controller
{
    public function subscribe(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'email' => ['required', 'email:rfc', 'max:255'],
        ]);

        $subscriber = NewsletterSubscriber::firstOrCreate(
            ['email' => mb_strtolower(trim($validated['email']))],
            ['source' => 'footer']
        );

        return response()->json([
            'message' => $subscriber->wasRecentlyCreated
                ? 'Thank you! You are now subscribed.'
                : 'This email is already subscribed.',
        ], $subscriber->wasRecentlyCreated ? 201 : 200);
    }

    public function index(Request $request): View
    {
        abort_unless(auth()->user()?->user_type === 'admin', 403);

        $search = trim((string) $request->query('search'));
        $subscribers = NewsletterSubscriber::query()
            ->when($search !== '', fn ($query) => $query->where('email', 'like', '%' . $search . '%'))
            ->latest()
            ->paginate(25)
            ->withQueryString();

        return view('newsletter-subscribers.index', compact('subscribers', 'search'));
    }

    public function destroy(NewsletterSubscriber $newsletterSubscriber): RedirectResponse
    {
        abort_unless(auth()->user()?->user_type === 'admin', 403);

        $newsletterSubscriber->delete();

        return redirect()->route('admin-newsletter.index')->with('success', 'Subscriber removed successfully.');
    }
}
