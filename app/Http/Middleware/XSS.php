<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class XSS
{
    public function handle(Request $request, Closure $next)
    {
        $this->sanitize($request->all());

        return $next($request);
    }

    private function sanitize(array $data): void
    {
        foreach ($data as $key => $value) {
            if (is_array($value)) {
                $this->sanitize($value);
                continue;
            }

            if (!is_string($value)) {
                continue;
            }

            $clean = $value;
            $clean = strip_tags($clean);
            $clean = preg_replace('/<\s*script\b[^>]*>(.*?)<\s*\/\s*script\s*>/is', '', $clean);
            $clean = preg_replace('/<\s*script\b[^>]*>/is', '', $clean);
            $clean = trim($clean);

            request()->merge([$key => $clean]);
        }
    }
}

