// Android 12 added a 3rd parameter (sp<IBinder>) to Surface::Surface().
// Legacy vendor blobs (libmot_gpu_mapper) still call the old 2-argument form.
extern "C" {
void _ZN7android7SurfaceC1ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEE(void*, const void*, bool, const void*);
void _ZN7android7SurfaceC2ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEE(void*, const void*, bool, const void*);

static void* const kNullBinder = nullptr;

void _ZN7android7SurfaceC1ERKNS_2spINS_22IGraphicBufferProducerEEEb(void* thiz, const void* gbp, bool b) {
    _ZN7android7SurfaceC1ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEE(thiz, gbp, b, &kNullBinder);
}
void _ZN7android7SurfaceC2ERKNS_2spINS_22IGraphicBufferProducerEEEb(void* thiz, const void* gbp, bool b) {
    _ZN7android7SurfaceC2ERKNS_2spINS_22IGraphicBufferProducerEEEbRKNS1_INS_7IBinderEEE(thiz, gbp, b, &kNullBinder);
}
}
