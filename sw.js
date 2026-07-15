// SoloCharge Service Worker v1.0
const CACHE = 'solocharge-v1';
const FILES = [
  'index.html',
  'manifest.json',
  'icons/icon-192.svg',
  'icons/icon-512.svg'
];

self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE).then(c => c.addAll(FILES)).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys().then(keys => Promise.all(
      keys.filter(k => k !== CACHE).map(k => caches.delete(k))
    )).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  e.respondWith(
    caches.match(e.request).then(r => r || fetch(e.request).catch(() => new Response(
      '<html><body style="background:#0D0F14;color:#E8E6E0;display:flex;align-items:center;justify-content:center;font-family:sans-serif;margin:0"><div style="text-align:center"><h2 style="font-weight:200">SoloCharge</h2><p style="color:#9A9890">离线模式 — 记录将在联网后同步</p></div></body></html>',
      { headers: {'Content-Type': 'text/html;charset=utf-8'} }
    )))
  );
});
