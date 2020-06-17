#include <math.h>
#include <stdint.h>


extern "C" long long __aeabi_f2lz(float a)
{
    if (a <= 0.0f) return 0; // __fixunssfdi
    double da = a;
    uint32_t high = da / 4294967296.f; // da / 0x1p32f;
    uint32_t low = da - (double)high * 4294967296.f; // high * 0x1p32f;
    return ((uint64_t)high << 32) | low;
}
