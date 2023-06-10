'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "0f5d6b101c186853b08c71394577c7dc",
"assets/assets/fonts/Nunito/static/Nunito-LightItalic.ttf": "43fe69699aa7c354a8b136343ccd0379",
"assets/assets/fonts/Nunito/static/Nunito-Bold.ttf": "9772667f53d0a85e7b09b879821ef01b",
"assets/assets/fonts/Nunito/static/Nunito-Light.ttf": "b156cb385240dd7ef80df5181313125e",
"assets/assets/fonts/Nunito/static/Nunito-Medium.ttf": "b500fbae7078c1679bf7c67e59575953",
"assets/assets/fonts/Nunito/static/Nunito-Regular.ttf": "2cd487d187b602d1fa522f8af05f1fbd",
"assets/assets/fonts/Nunito/static/Nunito-Black.ttf": "e30379228b51416f67dbc6f68965bf08",
"assets/assets/fonts/Roboto_Slab/static/RobotoSlab-Light.ttf": "3639ab999354e3de6a1d9e6f6498e166",
"assets/assets/fonts/Roboto_Slab/static/RobotoSlab-Bold.ttf": "cd3b78a13fa5a88181b0bb2b04eae3a8",
"assets/assets/fonts/Nunito_Sans/static/NunitoSans_10pt_Expanded-Black.ttf": "607656ad09e0e2d869c4b867995ad128",
"assets/assets/fonts/Nunito_Sans/static/NunitoSans_10pt-Black.ttf": "f4fb8d76d5a6e9326d82f33b64cf2572",
"assets/assets/fonts/Tajawal/Tajawal-Light.ttf": "b6f8ed4fd29cc11d562ce730712aeaae",
"assets/assets/fonts/Tajawal/Tajawal-Black.ttf": "bc674767a78d2808b19a818d9742a4af",
"assets/assets/fonts/Tajawal/Tajawal-Regular.ttf": "e3fe295c55a0cb720f766bccc5eecf63",
"assets/assets/fonts/Tajawal/Tajawal-Bold.ttf": "76f83be859d749342ba420e1bb010d6a",
"assets/assets/fonts/Rubik_Mono_One/RubikMonoOne-Regular.ttf": "f5486d33c22f837e905d600a5407da06",
"assets/assets/images/LogoVaquinhadoRi-simples-semfundo.png": "fb23151700a6372baa99e25334dbe0ec",
"assets/assets/images/ImagemClassificacaoSupelec.png": "cd7f83b1b7af7aa88f2cc6c0a39d2013",
"assets/assets/images/LogoVaquinhadoRi-simples-quadrado-semfundo.png": "37380fb6149fbe356e7fe79c29d643cb",
"assets/assets/images/logoCS.png": "16c64307a9791626ee30a91dcfc49839",
"assets/assets/images/perfil.png": "d03fef49a1a693bf0a1e3403632f1cd0",
"assets/assets/images/LogoVaquinhadoRi-semfundo.png": "2d91afbb9e3c3806d61b32a6c1151010",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "2d58fe6e61efd8d8c8df9ea51e551e78",
"assets/FontManifest.json": "4fddcaaef7dccb78dd0af739db3065cb",
"main.dart.js": "eb1a4a981de637abbdd43672fad6a8b2",
"favicon-16x16.png": "403522bd0cb82ff0eacd70e2093b38cc",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"manifest.json": "7b623b988982b8ded7880d22c2c3d51c",
"favicon-32x32.png": "a858b90bc92e4b75fb2c216f6960e207",
"version.json": "c36034f3ce0c75d0d81a4615fddf76d6",
"LogoVaquinhadoRi-simples-quadrado.png": "1ff93bcd2d558de28e147d000e7ac002",
"icons/icon-192x192.png": "1bfed55aaabedceb695b9c2f3224c212",
"icons/apple-touch-icon.png": "354dc07f7b83597b6b858ec91d833ecc",
"icons/Icon-maskable-192.old.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/icon-512x512.png": "eb8fba46f8eccce7bced2305f85e3f44",
"icons/Icon-192.old.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.old.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.old.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6eb54b9077bb75f725edbe3bf7b459e1",
"/": "6eb54b9077bb75f725edbe3bf7b459e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
