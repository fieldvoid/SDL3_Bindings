module sdl3_bindings;

@nogc:
nothrow:

//--- SDL numeric types ----------------------------------------

alias Uint32 = uint;
alias Uint64 = ulong;
alias Uint16 = ushort;
alias Uint8 = ubyte;
alias int32 = int;
alias int64 = long;
alias int16 = short;
alias int8 = byte;
alias Sint32 = int;
alias Sint64 = long;
alias Sint16 = short;
alias Sint8 = byte;

//--- SDL3 Initialization -------------------------------------

alias SDL_InitFlags = uint;
enum SDL_InitFlags SDL_INIT_AUDIO =     0x_10_u;
enum SDL_InitFlags SDL_INIT_VIDEO =     0x_20_u;
enum SDL_InitFlags SDL_INIT_JOYSTICK =  0x_200_u;
enum SDL_InitFlags SDL_INIT_HAPTIC =    0x_1000_u;
enum SDL_InitFlags SDL_INIT_GAMEPAD =   0x_2000_u;
enum SDL_InitFlags SDL_INIT_EVENTS =    0x_4000_u;
enum SDL_InitFlags SDL_INIT_SENSOR =    0x_8000_u;
enum SDL_InitFlags SDL_INIT_CAMERA =    0x_10000_u;

extern (C) bool SDL_Init (SDL_InitFlags flags);
extern (C) void SDL_Quit ();

//--- SDL3 Windows -------------------------------------------

struct SDL_Window;

alias SDL_WindowFlags = uint;

enum SDL_WindowFlags SDL_WINDOW_FULLSCREEN =            0x000000000000000_1_uL;    /**< window is in fullscreen mode */
enum SDL_WindowFlags SDL_WINDOW_OPENGL =                0x000000000000000_2_uL;    /**< window usable with OpenGL context */
enum SDL_WindowFlags SDL_WINDOW_OCCLUDED =              0x000000000000000_4_uL;    /**< window is occluded */
enum SDL_WindowFlags SDL_WINDOW_HIDDEN =                0x000000000000000_8_uL;    /**< window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible */
enum SDL_WindowFlags SDL_WINDOW_BORDERLESS =            0x00000000000000_10_uL;    /**< no window decoration */
enum SDL_WindowFlags SDL_WINDOW_RESIZABLE =             0x00000000000000_20_uL;    /**< window can be resized */
enum SDL_WindowFlags SDL_WINDOW_MINIMIZED =             0x00000000000000_40_uL;    /**< window is minimized */
enum SDL_WindowFlags SDL_WINDOW_MAXIMIZED =             0x00000000000000_80_uL;    /**< window is maximized */
enum SDL_WindowFlags SDL_WINDOW_MOUSE_GRABBED =         0x0000000000000_100_uL;    /**< window has grabbed mouse input */
enum SDL_WindowFlags SDL_WINDOW_INPUT_FOCUS =           0x0000000000000_200_uL;    /**< window has input focus */
enum SDL_WindowFlags SDL_WINDOW_MOUSE_FOCUS =           0x0000000000000_400_uL;    /**< window has mouse focus */
enum SDL_WindowFlags SDL_WINDOW_EXTERNAL =              0x0000000000000_800_uL;    /**< window not created by SDL */
enum SDL_WindowFlags SDL_WINDOW_MODAL =                 0x000000000000_1000_uL;    /**< window is modal */
enum SDL_WindowFlags SDL_WINDOW_HIGH_PIXEL_DENSITY =    0x000000000000_2000_uL;    /**< window uses high pixel density back buffer if possible */
enum SDL_WindowFlags SDL_WINDOW_MOUSE_CAPTURE =         0x000000000000_4000_uL;    /**< window has mouse captured (unrelated to MOUSE_GRABBED) */
enum SDL_WindowFlags SDL_WINDOW_MOUSE_RELATIVE_MODE =   0x000000000000_8000_uL;    /**< window has relative mode enabled */
enum SDL_WindowFlags SDL_WINDOW_ALWAYS_ON_TOP =         0x00000000000_10000_uL;    /**< window should always be above others */
enum SDL_WindowFlags SDL_WINDOW_UTILITY =               0x00000000000_20000_uL;    /**< window should be treated as a utility window, not showing in the task bar and window list */
enum SDL_WindowFlags SDL_WINDOW_TOOLTIP =               0x00000000000_40000_uL;    /**< window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window */
enum SDL_WindowFlags SDL_WINDOW_POPUP_MENU =            0x00000000000_80000_uL;    /**< window should be treated as a popup menu, requires a parent window */
enum SDL_WindowFlags SDL_WINDOW_KEYBOARD_GRABBED =      0x0000000000_100000_uL;    /**< window has grabbed keyboard input */
enum SDL_WindowFlags SDL_WINDOW_VULKAN =                0x00000000_10000000_uL;    /**< window usable for Vulkan surface */
enum SDL_WindowFlags SDL_WINDOW_METAL =                 0x00000000_20000000_uL;    /**< window usable for Metal view */
enum SDL_WindowFlags SDL_WINDOW_TRANSPARENT =           0x00000000_40000000_uL;    /**< window with transparent buffer */
enum SDL_WindowFlags SDL_WINDOW_NOT_FOCUSABLE =         0x00000000_80000000_uL;    /**< window should not be focusable */

extern (C) SDL_Window* SDL_CreateWindow (const(char)* title, int w, int h, SDL_WindowFlags flags);
extern (C) void SDL_DestroyWindow (SDL_Window* window);

//-- SDL3 Colors -------------------------------------------

struct SDL_FColor {
    float r, g, b, a;
}

//--- SDL3 Points ------------------------------------------

struct SDL_FPoint {
    float x, y;
}

struct SDL_Vertex {
    SDL_FPoint position;
    SDL_FColor color;
    SDL_FPoint tex_coord;
}

//--- SDL3 Textures ----------------------------------------

struct SDL_Texture {
    SDL_PixelFormat format;
    int w, h;
    int refcount;
}

alias SDL_PixelFormat = int;

enum : SDL_PixelFormat
{
    SDL_PIXELFORMAT_UNKNOWN = 0,
    SDL_PIXELFORMAT_INDEX1LSB = 0x11100100u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, 1, 0), */
    SDL_PIXELFORMAT_INDEX1MSB = 0x11200100u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, 1, 0), */
    SDL_PIXELFORMAT_INDEX2LSB = 0x1c100200u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_4321, 0, 2, 0), */
    SDL_PIXELFORMAT_INDEX2MSB = 0x1c200200u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_1234, 0, 2, 0), */
    SDL_PIXELFORMAT_INDEX4LSB = 0x12100400u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, 4, 0), */
    SDL_PIXELFORMAT_INDEX4MSB = 0x12200400u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, 4, 0), */
    SDL_PIXELFORMAT_INDEX8 = 0x13000801u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1), */
    SDL_PIXELFORMAT_RGB332 = 0x14110801u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_332, 8, 1), */
    SDL_PIXELFORMAT_XRGB4444 = 0x15120c02u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_4444, 12, 2), */
    SDL_PIXELFORMAT_XBGR4444 = 0x15520c02u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_4444, 12, 2), */
    SDL_PIXELFORMAT_XRGB1555 = 0x15130f02u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_1555, 15, 2), */
    SDL_PIXELFORMAT_XBGR1555 = 0x15530f02u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_1555, 15, 2), */
    SDL_PIXELFORMAT_ARGB4444 = 0x15321002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_RGBA4444 = 0x15421002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_ABGR4444 = 0x15721002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_BGRA4444 = 0x15821002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_ARGB1555 = 0x15331002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_1555, 16, 2), */
    SDL_PIXELFORMAT_RGBA5551 = 0x15441002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_5551, 16, 2), */
    SDL_PIXELFORMAT_ABGR1555 = 0x15731002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_1555, 16, 2), */
    SDL_PIXELFORMAT_BGRA5551 = 0x15841002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_5551, 16, 2), */
    SDL_PIXELFORMAT_RGB565 = 0x15151002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_565, 16, 2), */
    SDL_PIXELFORMAT_BGR565 = 0x15551002u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_565, 16, 2), */
    SDL_PIXELFORMAT_RGB24 = 0x17101803u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, 24, 3), */
    SDL_PIXELFORMAT_BGR24 = 0x17401803u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, 24, 3), */
    SDL_PIXELFORMAT_XRGB8888 = 0x16161804u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_RGBX8888 = 0x16261804u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_XBGR8888 = 0x16561804u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_BGRX8888 = 0x16661804u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_ARGB8888 = 0x16362004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_RGBA8888 = 0x16462004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_ABGR8888 = 0x16762004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_BGRA8888 = 0x16862004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_XRGB2101010 = 0x16172004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_XBGR2101010 = 0x16572004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_ARGB2101010 = 0x16372004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_ABGR2101010 = 0x16772004u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_RGB48 = 0x18103006u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGB, 0, 48, 6), */
    SDL_PIXELFORMAT_BGR48 = 0x18403006u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGR, 0, 48, 6), */
    SDL_PIXELFORMAT_RGBA64 = 0x18204008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGBA, 0, 64, 8), */
    SDL_PIXELFORMAT_ARGB64 = 0x18304008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ARGB, 0, 64, 8), */
    SDL_PIXELFORMAT_BGRA64 = 0x18504008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGRA, 0, 64, 8), */
    SDL_PIXELFORMAT_ABGR64 = 0x18604008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ABGR, 0, 64, 8), */
    SDL_PIXELFORMAT_RGB48_FLOAT = 0x1a103006u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGB, 0, 48, 6), */
    SDL_PIXELFORMAT_BGR48_FLOAT = 0x1a403006u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGR, 0, 48, 6), */
    SDL_PIXELFORMAT_RGBA64_FLOAT = 0x1a204008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGBA, 0, 64, 8), */
    SDL_PIXELFORMAT_ARGB64_FLOAT = 0x1a304008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ARGB, 0, 64, 8), */
    SDL_PIXELFORMAT_BGRA64_FLOAT = 0x1a504008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGRA, 0, 64, 8), */
    SDL_PIXELFORMAT_ABGR64_FLOAT = 0x1a604008u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ABGR, 0, 64, 8), */
    SDL_PIXELFORMAT_RGB96_FLOAT = 0x1b10600cu,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGB, 0, 96, 12), */
    SDL_PIXELFORMAT_BGR96_FLOAT = 0x1b40600cu,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGR, 0, 96, 12), */
    SDL_PIXELFORMAT_RGBA128_FLOAT = 0x1b208010u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGBA, 0, 128, 16), */
    SDL_PIXELFORMAT_ARGB128_FLOAT = 0x1b308010u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ARGB, 0, 128, 16), */
    SDL_PIXELFORMAT_BGRA128_FLOAT = 0x1b508010u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGRA, 0, 128, 16), */
    SDL_PIXELFORMAT_ABGR128_FLOAT = 0x1b608010u,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ABGR, 0, 128, 16), */

    SDL_PIXELFORMAT_YV12 = 0x32315659u,      /**< Planar mode: Y + V + U  (3 planes) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'V', '1', '2'), */
    SDL_PIXELFORMAT_IYUV = 0x56555949u,      /**< Planar mode: Y + U + V  (3 planes) */
        /* SDL_DEFINE_PIXELFOURCC('I', 'Y', 'U', 'V'), */
    SDL_PIXELFORMAT_YUY2 = 0x32595559u,      /**< Packed mode: Y0+U0+Y1+V0 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'U', 'Y', '2'), */
    SDL_PIXELFORMAT_UYVY = 0x59565955u,      /**< Packed mode: U0+Y0+V0+Y1 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('U', 'Y', 'V', 'Y'), */
    SDL_PIXELFORMAT_YVYU = 0x55595659u,      /**< Packed mode: Y0+V0+Y1+U0 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'V', 'Y', 'U'), */
    SDL_PIXELFORMAT_NV12 = 0x3231564eu,      /**< Planar mode: Y + U/V interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('N', 'V', '1', '2'), */
    SDL_PIXELFORMAT_NV21 = 0x3132564eu,      /**< Planar mode: Y + V/U interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('N', 'V', '2', '1'), */
    SDL_PIXELFORMAT_P010 = 0x30313050u,      /**< Planar mode: Y + U/V interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('P', '0', '1', '0'), */
    SDL_PIXELFORMAT_EXTERNAL_OES = 0x2053454fu,     /**< Android video texture format */
        /* SDL_DEFINE_PIXELFOURCC('O', 'E', 'S', ' ') */
}

enum SDL_BIG_ENDIAN = 4321;
enum SDL_LIL_ENDIAN = 1234;

enum SDL_BYTEORDER = SDL_LIL_ENDIAN; // Figure out a way to generate this value at compile-time. But for now hard-code.

static if (SDL_BYTEORDER == SDL_BIG_ENDIAN)
{
    enum SDL_PixelFormat SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_RGBA8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_ARGB8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_BGRA8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_ABGR8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_RGBX32 = SDL_PIXELFORMAT_RGBX8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_XRGB32 = SDL_PIXELFORMAT_XRGB8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_BGRX32 = SDL_PIXELFORMAT_BGRX8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_XBGR32 = SDL_PIXELFORMAT_XBGR8888;
}
else
{
    enum SDL_PixelFormat SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_ABGR8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_BGRA8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_ARGB8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_RGBA8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_RGBX32 = SDL_PIXELFORMAT_XBGR8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_XRGB32 = SDL_PIXELFORMAT_BGRX8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_BGRX32 = SDL_PIXELFORMAT_XRGB8888;
    enum SDL_PixelFormat SDL_PIXELFORMAT_XBGR32 = SDL_PIXELFORMAT_RGBX8888;
}

//--- SDL3 Renderer ----------------------------------------

struct SDL_Renderer;

extern (C) SDL_Renderer* SDL_CreateRenderer (SDL_Window* window, const(char)* name);
extern (C) void SDL_DestroyRenderer (SDL_Renderer* renderer);

extern (C) void SDL_RenderGeometry (
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const(SDL_Vertex)* vertices, int num_vertices,
    const(int)* indices, int num_indices,
);

extern (C) void SDL_RenderGeometryRaw (
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const(float)* xy, int xy_stride,
    const(SDL_FColor)* color, int color_stride,
    const(float)* uv, int uv_stride,
    int num_vertices,
    const(void)* indices, int num_indices, int size_indices,
);

//--- SDL3 GPU ---------------------------------------------

struct SDL_GPUDevice;

alias SDL_GPUShaderFormat = uint;

enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_INVALID =  0;
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_PRIVATE =  (1u << 0); /**< Shaders for NDA'd platforms. */
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_SPIRV =    (1u << 1); /**< SPIR-V shaders for Vulkan. */
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_DXBC =     (1u << 2); /**< DXBC SM5_1 shaders for D3D12. */
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_DXIL =     (1u << 3); /**< DXIL SM6_0 shaders for D3D12. */
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_MSL =      (1u << 4); /**< MSL shaders for Metal. */
enum SDL_GPUShaderFormat SDL_GPU_SHADERFORMAT_METALLIB = (1u << 5); /**< Precompiled metallib shaders for Metal. */

extern (C) SDL_GPUDevice* SDL_CreateGPUDevice (SDL_GPUShaderFormat format_flags, bool debug_mode, const(char)* name);
extern (C) void SDL_DestroyGPUDevice (SDL_GPUDevice* device);

extern (C) bool SDL_ClaimWindowForGPUDevice (SDL_GPUDevice* device, SDL_Window* window);
extern (C) void SDL_ReleaseWindowFromGPUDevice (SDL_GPUDevice* device, SDL_Window* window);

struct SDL_GPUCommandBuffer;

extern (C) SDL_GPUCommandBuffer* SDL_AcquireGPUCommandBuffer (SDL_GPUDevice* device);
extern (C) bool SDL_SubmitGPUCommandBuffer (SDL_GPUCommandBuffer* command_buffer);

struct SDL_GPUTexture;

extern (C) bool SDL_WaitAndAcquireGPUSwapchainTexture (
    SDL_GPUCommandBuffer* command_buffer,
    SDL_Window* window,
    SDL_GPUTexture** swapchain_texture,
    Uint32* swapchain_texture_width,
    Uint32* swapchain_texture_height,
);

struct SDL_GPURenderPass;

extern (C) SDL_GPURenderPass* SDL_BeginGPURenderPass (
    SDL_GPUCommandBuffer* command_buffer,
    const(SDL_GPUColorTargetInfo*) color_target_infos,
    Uint32 num_color_targets,
    const(SDL_GPUDepthStencilTargetInfo*) depth_stencil_target_info,
);

extern (C) void SDL_EndGPURenderPass (SDL_GPURenderPass* render_pass);

struct SDL_GPUColorTargetInfo {
    SDL_GPUTexture *texture;         /**< The texture that will be used as a color target by a render pass. */
    Uint32 mip_level;                /**< The mip level to use as a color target. */
    Uint32 layer_or_depth_plane;     /**< The layer index or depth plane to use as a color target. This value is treated as a layer index on 2D array and cube textures, and as a depth plane on 3D textures. */
    SDL_FColor clear_color;          /**< The color to clear the color target to at the start of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used. */
    SDL_GPULoadOp load_op;           /**< What is done with the contents of the color target at the beginning of the render pass. */
    SDL_GPUStoreOp store_op;         /**< What is done with the results of the render pass. */
    SDL_GPUTexture *resolve_texture; /**< The texture that will receive the results of a multisample resolve operation. Ignored if a RESOLVE* store_op is not used. */
    Uint32 resolve_mip_level;        /**< The mip level of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used. */
    Uint32 resolve_layer;            /**< The layer index of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used. */
    bool cycle;                      /**< true cycles the texture if the texture is bound and load_op is not LOAD */
    bool cycle_resolve_texture;      /**< true cycles the resolve texture if the resolve texture is bound. Ignored if a RESOLVE* store_op is not used. */
    Uint8 padding1;
    Uint8 padding2;
}

alias SDL_GPULoadOp = int;

enum : SDL_GPULoadOp
{
    SDL_GPU_LOADOP_LOAD,      /**< The previous contents of the texture will be preserved. */
    SDL_GPU_LOADOP_CLEAR,     /**< The contents of the texture will be cleared to a color. */
    SDL_GPU_LOADOP_DONT_CARE  /**< The previous contents of the texture need not be preserved. The contents will be undefined. */
}

alias SDL_GPUStoreOp = int;

enum : SDL_GPUStoreOp
{
    SDL_GPU_STOREOP_STORE,             /**< The contents generated during the render pass will be written to memory. */
    SDL_GPU_STOREOP_DONT_CARE,         /**< The contents generated during the render pass are not needed and may be discarded. The contents will be undefined. */
    SDL_GPU_STOREOP_RESOLVE,           /**< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture may then be discarded and will be undefined. */
    SDL_GPU_STOREOP_RESOLVE_AND_STORE  /**< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture will be written to memory. */
}

struct SDL_GPUDepthStencilTargetInfo {
    SDL_GPUTexture *texture;               /**< The texture that will be used as the depth stencil target by the render pass. */
    float clear_depth;                     /**< The value to clear the depth component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used. */
    SDL_GPULoadOp load_op;                 /**< What is done with the depth contents at the beginning of the render pass. */
    SDL_GPUStoreOp store_op;               /**< What is done with the depth results of the render pass. */
    SDL_GPULoadOp stencil_load_op;         /**< What is done with the stencil contents at the beginning of the render pass. */
    SDL_GPUStoreOp stencil_store_op;       /**< What is done with the stencil results of the render pass. */
    bool cycle;                            /**< true cycles the texture if the texture is bound and any load ops are not LOAD */
    Uint8 clear_stencil;                   /**< The value to clear the stencil component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used. */
    Uint8 padding1;
    Uint8 padding2;
}

struct SDL_GPUGraphicsPipeline;

extern (C) SDL_GPUGraphicsPipeline* SDL_CreateGPUGraphicsPipeline (
    SDL_GPUDevice* device, const(SDL_GPUGraphicsPipelineCreateInfo)* createinfo,
);

struct SDL_GPUGraphicsPipelineCreateInfo {
    SDL_GPUShader *vertex_shader;                   /**< The vertex shader used by the graphics pipeline. */
    SDL_GPUShader *fragment_shader;                 /**< The fragment shader used by the graphics pipeline. */
    SDL_GPUVertexInputState vertex_input_state;     /**< The vertex layout of the graphics pipeline. */
    SDL_GPUPrimitiveType primitive_type;            /**< The primitive topology of the graphics pipeline. */
    SDL_GPURasterizerState rasterizer_state;        /**< The rasterizer state of the graphics pipeline. */
    SDL_GPUMultisampleState multisample_state;      /**< The multisample state of the graphics pipeline. */
    SDL_GPUDepthStencilState depth_stencil_state;   /**< The depth-stencil state of the graphics pipeline. */
    SDL_GPUGraphicsPipelineTargetInfo target_info;  /**< Formats and blend modes for the render targets of the graphics pipeline. */
    SDL_PropertiesID props;                         /**< A properties ID for extensions. Should be 0 if no extensions are needed. */
}

struct SDL_GPUShader;

struct SDL_GPUVertexInputState {
    const SDL_GPUVertexBufferDescription *vertex_buffer_descriptions; /**< A pointer to an array of vertex buffer descriptions. */
    Uint32 num_vertex_buffers;                                        /**< The number of vertex buffer descriptions in the above array. */
    const SDL_GPUVertexAttribute *vertex_attributes;                  /**< A pointer to an array of vertex attribute descriptions. */
    Uint32 num_vertex_attributes;                                     /**< The number of vertex attribute descriptions in the above array. */
}

struct SDL_GPUVertexBufferDescription {
    Uint32 slot;                        /**< The binding slot of the vertex buffer. */
    Uint32 pitch;                       /**< The byte pitch between consecutive elements of the vertex buffer. */
    SDL_GPUVertexInputRate input_rate;  /**< Whether attribute addressing is a function of the vertex index or instance index. */
    Uint32 instance_step_rate;          /**< Reserved for future use. Must be set to 0. */
}

alias SDL_GPUVertexInputRate = int;

enum : SDL_GPUVertexInputRate
{
    SDL_GPU_VERTEXINPUTRATE_VERTEX,   /**< Attribute addressing is a function of the vertex index. */
    SDL_GPU_VERTEXINPUTRATE_INSTANCE  /**< Attribute addressing is a function of the instance index. */
}

struct SDL_GPUVertexAttribute {
    Uint32 location;                    /**< The shader input location index. */
    Uint32 buffer_slot;                 /**< The binding slot of the associated vertex buffer. */
    SDL_GPUVertexElementFormat format;  /**< The size and type of the attribute data. */
    Uint32 offset;                      /**< The byte offset of this attribute relative to the start of the vertex element. */
}

alias SDL_GPUVertexElementFormat = int;

enum : SDL_GPUVertexElementFormat
{
    SDL_GPU_VERTEXELEMENTFORMAT_INVALID,

    /* 32-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_INT,
    SDL_GPU_VERTEXELEMENTFORMAT_INT2,
    SDL_GPU_VERTEXELEMENTFORMAT_INT3,
    SDL_GPU_VERTEXELEMENTFORMAT_INT4,

    /* 32-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_UINT,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT4,

    /* 32-bit Floats */
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,

    /* 8-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,

    /* 8-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,

    /* 8-bit Signed Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,

    /* 8-bit Unsigned Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,

    /* 16-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,

    /* 16-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,

    /* 16-bit Signed Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,

    /* 16-bit Unsigned Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,

    /* 16-bit Floats */
    SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
    SDL_GPU_VERTEXELEMENTFORMAT_HALF4,
}

alias SDL_GPUPrimitiveType = int;

enum : SDL_GPUPrimitiveType
{
    SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,  /**< A series of separate triangles. */
    SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP, /**< A series of connected triangles. */
    SDL_GPU_PRIMITIVETYPE_LINELIST,      /**< A series of separate lines. */
    SDL_GPU_PRIMITIVETYPE_LINESTRIP,     /**< A series of connected lines. */
    SDL_GPU_PRIMITIVETYPE_POINTLIST,      /**< A series of separate points. */
}

struct SDL_GPURasterizerState {
    SDL_GPUFillMode fill_mode;         /**< Whether polygons will be filled in or drawn as lines. */
    SDL_GPUCullMode cull_mode;         /**< The facing direction in which triangles will be culled. */
    SDL_GPUFrontFace front_face;       /**< The vertex winding that will cause a triangle to be determined as front-facing. */
    float depth_bias_constant_factor;  /**< A scalar factor controlling the depth value added to each fragment. */
    float depth_bias_clamp;            /**< The maximum depth bias of a fragment. */
    float depth_bias_slope_factor;     /**< A scalar factor applied to a fragment's slope in depth calculations. */
    bool enable_depth_bias;            /**< true to bias fragment depth values. */
    bool enable_depth_clip;            /**< true to enable depth clip, false to enable depth clamp. */
    Uint8 padding1;
    Uint8 padding2;
}

alias SDL_GPUFillMode = int;

enum : SDL_GPUFillMode
{
    SDL_GPU_FILLMODE_FILL,  /**< Polygons will be rendered via rasterization. */
    SDL_GPU_FILLMODE_LINE   /**< Polygon edges will be drawn as line segments. */
}

alias SDL_GPUCullMode = int;

enum : SDL_GPUCullMode
{
    SDL_GPU_CULLMODE_NONE,   /**< No triangles are culled. */
    SDL_GPU_CULLMODE_FRONT,  /**< Front-facing triangles are culled. */
    SDL_GPU_CULLMODE_BACK,    /**< Back-facing triangles are culled. */
}

alias SDL_GPUFrontFace = int;

enum : SDL_GPUFrontFace
{
    SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE,  /**< A triangle with counter-clockwise vertex winding will be considered front-facing. */
    SDL_GPU_FRONTFACE_CLOCKWISE           /**< A triangle with clockwise vertex winding will be considered front-facing. */
}

struct SDL_GPUMultisampleState {
    SDL_GPUSampleCount sample_count;  /**< The number of samples to be used in rasterization. */
    Uint32 sample_mask;               /**< Reserved for future use. Must be set to 0. */
    bool enable_mask;                 /**< Reserved for future use. Must be set to false. */
    bool enable_alpha_to_coverage;    /**< true enables the alpha-to-coverage feature. */
    Uint8 padding2;
    Uint8 padding3;
}

alias SDL_GPUSampleCount = int;

enum : SDL_GPUSampleCount
{
    SDL_GPU_SAMPLECOUNT_1,  /**< No multisampling. */
    SDL_GPU_SAMPLECOUNT_2,  /**< MSAA 2x */
    SDL_GPU_SAMPLECOUNT_4,  /**< MSAA 4x */
    SDL_GPU_SAMPLECOUNT_8,   /**< MSAA 8x */
}

struct SDL_GPUDepthStencilState {
    SDL_GPUCompareOp compare_op;                /**< The comparison operator used for depth testing. */
    SDL_GPUStencilOpState back_stencil_state;   /**< The stencil op state for back-facing triangles. */
    SDL_GPUStencilOpState front_stencil_state;  /**< The stencil op state for front-facing triangles. */
    Uint8 compare_mask;                         /**< Selects the bits of the stencil values participating in the stencil test. */
    Uint8 write_mask;                           /**< Selects the bits of the stencil values updated by the stencil test. */
    bool enable_depth_test;                     /**< true enables the depth test. */
    bool enable_depth_write;                    /**< true enables depth writes. Depth writes are always disabled when enable_depth_test is false. */
    bool enable_stencil_test;                   /**< true enables the stencil test. */
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
}

alias SDL_GPUCompareOp = int;

enum : SDL_GPUCompareOp
{
    SDL_GPU_COMPAREOP_INVALID,
    SDL_GPU_COMPAREOP_NEVER,             /**< The comparison always evaluates false. */
    SDL_GPU_COMPAREOP_LESS,              /**< The comparison evaluates reference < test. */
    SDL_GPU_COMPAREOP_EQUAL,             /**< The comparison evaluates reference == test. */
    SDL_GPU_COMPAREOP_LESS_OR_EQUAL,     /**< The comparison evaluates reference <= test. */
    SDL_GPU_COMPAREOP_GREATER,           /**< The comparison evaluates reference > test. */
    SDL_GPU_COMPAREOP_NOT_EQUAL,         /**< The comparison evaluates reference != test. */
    SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,  /**< The comparison evalutes reference >= test. */
    SDL_GPU_COMPAREOP_ALWAYS             /**< The comparison always evaluates true. */
}

struct SDL_GPUStencilOpState {
    SDL_GPUStencilOp fail_op;        /**< The action performed on samples that fail the stencil test. */
    SDL_GPUStencilOp pass_op;        /**< The action performed on samples that pass the depth and stencil tests. */
    SDL_GPUStencilOp depth_fail_op;  /**< The action performed on samples that pass the stencil test and fail the depth test. */
    SDL_GPUCompareOp compare_op;     /**< The comparison operator used in the stencil test. */
}

alias SDL_GPUStencilOp = int;

enum : SDL_GPUStencilOp
{
    SDL_GPU_STENCILOP_INVALID,
    SDL_GPU_STENCILOP_KEEP,                 /**< Keeps the current value. */
    SDL_GPU_STENCILOP_ZERO,                 /**< Sets the value to 0. */
    SDL_GPU_STENCILOP_REPLACE,              /**< Sets the value to reference. */
    SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,  /**< Increments the current value and clamps to the maximum value. */
    SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,  /**< Decrements the current value and clamps to 0. */
    SDL_GPU_STENCILOP_INVERT,               /**< Bitwise-inverts the current value. */
    SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,   /**< Increments the current value and wraps back to 0. */
    SDL_GPU_STENCILOP_DECREMENT_AND_WRAP    /**< Decrements the current value and wraps to the maximum value. */
}

struct SDL_GPUGraphicsPipelineTargetInfo {
    const SDL_GPUColorTargetDescription *color_target_descriptions;  /**< A pointer to an array of color target descriptions. */
    Uint32 num_color_targets;                                        /**< The number of color target descriptions in the above array. */
    SDL_GPUTextureFormat depth_stencil_format;                       /**< The pixel format of the depth-stencil target. Ignored if has_depth_stencil_target is false. */
    bool has_depth_stencil_target;                                   /**< true specifies that the pipeline uses a depth-stencil target. */
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
}

struct SDL_GPUColorTargetDescription {
    SDL_GPUTextureFormat format;               /**< The pixel format of the texture to be used as a color target. */
    SDL_GPUColorTargetBlendState blend_state;  /**< The blend state to be used for the color target. */
}

alias SDL_GPUTextureFormat = int;

enum : SDL_GPUTextureFormat
{
    SDL_GPU_TEXTUREFORMAT_INVALID,

    /* Unsigned Normalized Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
    SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
    /* Compressed Unsigned Normalized Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
    /* Compressed Signed Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
    /* Compressed Unsigned Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
    /* Signed Normalized Float Color Formats  */
    SDL_GPU_TEXTUREFORMAT_R8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
    /* Signed Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
    /* Unsigned Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
    /* Unsigned Integer Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
    SDL_GPU_TEXTUREFORMAT_R16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
    SDL_GPU_TEXTUREFORMAT_R32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
    /* Signed Integer Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
    SDL_GPU_TEXTUREFORMAT_R16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
    SDL_GPU_TEXTUREFORMAT_R32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
    /* SRGB Unsigned Normalized Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
    /* Compressed SRGB Unsigned Normalized Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
    /* Depth Formats */
    SDL_GPU_TEXTUREFORMAT_D16_UNORM,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
    /* Compressed ASTC Normalized Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
    /* Compressed SRGB ASTC Normalized Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
    /* Compressed ASTC Signed Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT,
}

struct SDL_GPUColorTargetBlendState {
    SDL_GPUBlendFactor src_color_blendfactor;     /**< The value to be multiplied by the source RGB value. */
    SDL_GPUBlendFactor dst_color_blendfactor;     /**< The value to be multiplied by the destination RGB value. */
    SDL_GPUBlendOp color_blend_op;                /**< The blend operation for the RGB components. */
    SDL_GPUBlendFactor src_alpha_blendfactor;     /**< The value to be multiplied by the source alpha. */
    SDL_GPUBlendFactor dst_alpha_blendfactor;     /**< The value to be multiplied by the destination alpha. */
    SDL_GPUBlendOp alpha_blend_op;                /**< The blend operation for the alpha component. */
    SDL_GPUColorComponentFlags color_write_mask;  /**< A bitmask specifying which of the RGBA components are enabled for writing. Writes to all channels if enable_color_write_mask is false. */
    bool enable_blend;                            /**< Whether blending is enabled for the color target. */
    bool enable_color_write_mask;                 /**< Whether the color write mask is enabled. */
    Uint8 padding1;
    Uint8 padding2;
}

alias SDL_GPUBlendFactor = int;

enum : SDL_GPUBlendFactor
{
    SDL_GPU_BLENDFACTOR_INVALID,
    SDL_GPU_BLENDFACTOR_ZERO,                      /**< 0 */
    SDL_GPU_BLENDFACTOR_ONE,                       /**< 1 */
    SDL_GPU_BLENDFACTOR_SRC_COLOR,                 /**< source color */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,       /**< 1 - source color */
    SDL_GPU_BLENDFACTOR_DST_COLOR,                 /**< destination color */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,       /**< 1 - destination color */
    SDL_GPU_BLENDFACTOR_SRC_ALPHA,                 /**< source alpha */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,       /**< 1 - source alpha */
    SDL_GPU_BLENDFACTOR_DST_ALPHA,                 /**< destination alpha */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,       /**< 1 - destination alpha */
    SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,            /**< blend constant */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,  /**< 1 - blend constant */
    SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE         /**< min(source alpha, 1 - destination alpha) */
}

alias SDL_GPUBlendOp = int;

enum : SDL_GPUBlendOp
{
    SDL_GPU_BLENDOP_INVALID,
    SDL_GPU_BLENDOP_ADD,               /**< (source * source_factor) + (destination * destination_factor) */
    SDL_GPU_BLENDOP_SUBTRACT,          /**< (source * source_factor) - (destination * destination_factor) */
    SDL_GPU_BLENDOP_REVERSE_SUBTRACT,  /**< (destination * destination_factor) - (source * source_factor) */
    SDL_GPU_BLENDOP_MIN,               /**< min(source, destination) */
    SDL_GPU_BLENDOP_MAX                /**< max(source, destination) */
}

alias SDL_GPUColorComponentFlags = Uint8;

enum : SDL_GPUColorComponentFlags
{
    SDL_GPU_COLORCOMPONENT_R = (1u << 0), /**< the red component */
    SDL_GPU_COLORCOMPONENT_G = (1u << 1), /**< the green component */
    SDL_GPU_COLORCOMPONENT_B = (1u << 2), /**< the blue component */
    SDL_GPU_COLORCOMPONENT_A = (1u << 3), /**< the alpha component */
}

alias SDL_PropertiesID = Uint32;

//--- SDL Events ---------------------------------------------

union SDL_Event
{
    uint type;                            /**< Event type, shared with all events, uint to cover user events which are not in the SDL_EventType enumeration */
    SDL_CommonEvent common;                 /**< Common event data */
    SDL_DisplayEvent display;               /**< Display event data */
    SDL_WindowEvent window;                 /**< Window event data */
    SDL_KeyboardDeviceEvent kdevice;        /**< Keyboard device change event data */
    SDL_KeyboardEvent key;                  /**< Keyboard event data */
    SDL_TextEditingEvent edit;              /**< Text editing event data */
    SDL_TextEditingCandidatesEvent edit_candidates; /**< Text editing candidates event data */
    SDL_TextInputEvent text;                /**< Text input event data */
    SDL_MouseDeviceEvent mdevice;           /**< Mouse device change event data */
    SDL_MouseMotionEvent motion;            /**< Mouse motion event data */
    SDL_MouseButtonEvent button;            /**< Mouse button event data */
    SDL_MouseWheelEvent wheel;              /**< Mouse wheel event data */
    SDL_JoyDeviceEvent jdevice;             /**< Joystick device change event data */
    SDL_JoyAxisEvent jaxis;                 /**< Joystick axis event data */
    SDL_JoyBallEvent jball;                 /**< Joystick ball event data */
    SDL_JoyHatEvent jhat;                   /**< Joystick hat event data */
    SDL_JoyButtonEvent jbutton;             /**< Joystick button event data */
    SDL_JoyBatteryEvent jbattery;           /**< Joystick battery event data */
    SDL_GamepadDeviceEvent gdevice;         /**< Gamepad device event data */
    SDL_GamepadAxisEvent gaxis;             /**< Gamepad axis event data */
    SDL_GamepadButtonEvent gbutton;         /**< Gamepad button event data */
    SDL_GamepadTouchpadEvent gtouchpad;     /**< Gamepad touchpad event data */
    SDL_GamepadSensorEvent gsensor;         /**< Gamepad sensor event data */
    SDL_AudioDeviceEvent adevice;           /**< Audio device event data */
    SDL_CameraDeviceEvent cdevice;          /**< Camera device event data */
    SDL_SensorEvent sensor;                 /**< Sensor event data */
    SDL_QuitEvent quit;                     /**< Quit request event data */
    SDL_UserEvent user;                     /**< Custom event data */
    SDL_TouchFingerEvent tfinger;           /**< Touch finger event data */
    SDL_PenProximityEvent pproximity;       /**< Pen proximity event data */
    SDL_PenTouchEvent ptouch;               /**< Pen tip touching event data */
    SDL_PenMotionEvent pmotion;             /**< Pen motion event data */
    SDL_PenButtonEvent pbutton;             /**< Pen button event data */
    SDL_PenAxisEvent paxis;                 /**< Pen axis event data */
    SDL_RenderEvent render;                 /**< Render event data */
    SDL_DropEvent drop;                     /**< Drag and drop event data */
    SDL_ClipboardEvent clipboard;           /**< Clipboard event data */

    /* This is necessary for ABI compatibility between Visual C++ and GCC.
       Visual C++ will respect the push pack pragma and use 52 bytes (size of
       SDL_TextEditingEvent, the largest structure for 32-bit and 64-bit
       architectures) for this union, and GCC will use the alignment of the
       largest datatype within the union, which is 8 bytes on 64-bit
       architectures.

       So... we'll add padding to force the size to be the same for both.

       On architectures where pointers are 16 bytes, this needs rounding up to
       the next multiple of 16, 64, and on architectures where pointers are
       even larger the size of SDL_UserEvent will dominate as being 3 pointers.
    */
    ubyte[128] padding;
}

extern (C) bool SDL_PollEvent (SDL_Event* event);

alias SDL_EventType = int;

enum : SDL_EventType
{
    SDL_EVENT_FIRST = 0, /**< Unused (do not remove) */
    SDL_EVENT_QUIT = 0x100, /**< User-requested quit */
    /* These application events have special meaning on iOS and Android, see README-ios.md and README-android.md for details */
    SDL_EVENT_TERMINATING,      /**< The application is being terminated by the OS. This event must be handled in a callback set with SDL_AddEventWatch().
                                  Called on iOS in applicationWillTerminate()
                                  Called on Android in onDestroy()
                                 */
    SDL_EVENT_LOW_MEMORY,       /**< The application is low on memory, free memory if possible. This event must be handled in a callback set with SDL_AddEventWatch().
                                  Called on iOS in applicationDidReceiveMemoryWarning()
                                  Called on Android in onTrimMemory()
                                 */
    SDL_EVENT_WILL_ENTER_BACKGROUND, /**< The application is about to enter the background. This event must be handled in a callback set with SDL_AddEventWatch().
                                       Called on iOS in applicationWillResignActive()
                                       Called on Android in onPause()
                                      */
    SDL_EVENT_DID_ENTER_BACKGROUND, /**< The application did enter the background and may not get CPU for some time. This event must be handled in a callback set with SDL_AddEventWatch().
                                      Called on iOS in applicationDidEnterBackground()
                                      Called on Android in onPause()
                                     */
    SDL_EVENT_WILL_ENTER_FOREGROUND, /**< The application is about to enter the foreground. This event must be handled in a callback set with SDL_AddEventWatch().
                                       Called on iOS in applicationWillEnterForeground()
                                       Called on Android in onResume()
                                      */
    SDL_EVENT_DID_ENTER_FOREGROUND, /**< The application is now interactive. This event must be handled in a callback set with SDL_AddEventWatch().
                                      Called on iOS in applicationDidBecomeActive()
                                      Called on Android in onResume()
                                     */

    SDL_EVENT_LOCALE_CHANGED,  /**< The user's locale preferences have changed. */

    SDL_EVENT_SYSTEM_THEME_CHANGED, /**< The system theme changed */

    /* Display events */
    /* 0x150 was SDL_DISPLAYEVENT, reserve the number for sdl2-compat */
    SDL_EVENT_DISPLAY_ORIENTATION = 0x151,   /**< Display orientation has changed to data1 */
    SDL_EVENT_DISPLAY_ADDED,                 /**< Display has been added to the system */
    SDL_EVENT_DISPLAY_REMOVED,               /**< Display has been removed from the system */
    SDL_EVENT_DISPLAY_MOVED,                 /**< Display has changed position */
    SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED,  /**< Display has changed desktop mode */
    SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED,  /**< Display has changed current mode */
    SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED, /**< Display has changed content scale */
    SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION,
    SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,

    /* Window events */
    /* 0x200 was SDL_WINDOWEVENT, reserve the number for sdl2-compat */
    /* 0x201 was SDL_EVENT_SYSWM, reserve the number for sdl2-compat */
    SDL_EVENT_WINDOW_SHOWN = 0x202,     /**< Window has been shown */
    SDL_EVENT_WINDOW_HIDDEN,            /**< Window has been hidden */
    SDL_EVENT_WINDOW_EXPOSED,           /**< Window has been exposed and should be redrawn, and can be redrawn directly from event watchers for this event */
    SDL_EVENT_WINDOW_MOVED,             /**< Window has been moved to data1, data2 */
    SDL_EVENT_WINDOW_RESIZED,           /**< Window has been resized to data1xdata2 */
    SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,/**< The pixel size of the window has changed to data1xdata2 */
    SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,/**< The pixel size of a Metal view associated with the window has changed */
    SDL_EVENT_WINDOW_MINIMIZED,         /**< Window has been minimized */
    SDL_EVENT_WINDOW_MAXIMIZED,         /**< Window has been maximized */
    SDL_EVENT_WINDOW_RESTORED,          /**< Window has been restored to normal size and position */
    SDL_EVENT_WINDOW_MOUSE_ENTER,       /**< Window has gained mouse focus */
    SDL_EVENT_WINDOW_MOUSE_LEAVE,       /**< Window has lost mouse focus */
    SDL_EVENT_WINDOW_FOCUS_GAINED,      /**< Window has gained keyboard focus */
    SDL_EVENT_WINDOW_FOCUS_LOST,        /**< Window has lost keyboard focus */
    SDL_EVENT_WINDOW_CLOSE_REQUESTED,   /**< The window manager requests that the window be closed */
    SDL_EVENT_WINDOW_HIT_TEST,          /**< Window had a hit test that wasn't SDL_HITTEST_NORMAL */
    SDL_EVENT_WINDOW_ICCPROF_CHANGED,   /**< The ICC profile of the window's display has changed */
    SDL_EVENT_WINDOW_DISPLAY_CHANGED,   /**< Window has been moved to display data1 */
    SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED, /**< Window display scale has been changed */
    SDL_EVENT_WINDOW_SAFE_AREA_CHANGED, /**< The window safe area has been changed */
    SDL_EVENT_WINDOW_OCCLUDED,          /**< The window has been occluded */
    SDL_EVENT_WINDOW_ENTER_FULLSCREEN,  /**< The window has entered fullscreen mode */
    SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,  /**< The window has left fullscreen mode */
    SDL_EVENT_WINDOW_DESTROYED,         /**< The window with the associated ID is being or has been destroyed. If this message is being handled
                                          in an event watcher, the window handle is still valid and can still be used to retrieve any properties
                                          associated with the window. Otherwise, the handle has already been destroyed and all resources
                                          associated with it are invalid */
    SDL_EVENT_WINDOW_HDR_STATE_CHANGED, /**< Window HDR properties have changed */
    SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
    SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_HDR_STATE_CHANGED,

    /* Keyboard events */
    SDL_EVENT_KEY_DOWN        = 0x300, /**< Key pressed */
    SDL_EVENT_KEY_UP,                  /**< Key released */
    SDL_EVENT_TEXT_EDITING,            /**< Keyboard text editing (composition) */
    SDL_EVENT_TEXT_INPUT,              /**< Keyboard text input */
    SDL_EVENT_KEYMAP_CHANGED,          /**< Keymap changed due to a system event such as an
                                         input language or keyboard layout change. */
    SDL_EVENT_KEYBOARD_ADDED,          /**< A new keyboard has been inserted into the system */
    SDL_EVENT_KEYBOARD_REMOVED,        /**< A keyboard has been removed */
    SDL_EVENT_TEXT_EDITING_CANDIDATES, /**< Keyboard text editing candidates */

    /* Mouse events */
    SDL_EVENT_MOUSE_MOTION    = 0x400, /**< Mouse moved */
    SDL_EVENT_MOUSE_BUTTON_DOWN,       /**< Mouse button pressed */
    SDL_EVENT_MOUSE_BUTTON_UP,         /**< Mouse button released */
    SDL_EVENT_MOUSE_WHEEL,             /**< Mouse wheel motion */
    SDL_EVENT_MOUSE_ADDED,             /**< A new mouse has been inserted into the system */
    SDL_EVENT_MOUSE_REMOVED,           /**< A mouse has been removed */

    /* Joystick events */
    SDL_EVENT_JOYSTICK_AXIS_MOTION  = 0x600, /**< Joystick axis motion */
    SDL_EVENT_JOYSTICK_BALL_MOTION,          /**< Joystick trackball motion */
    SDL_EVENT_JOYSTICK_HAT_MOTION,           /**< Joystick hat position change */
    SDL_EVENT_JOYSTICK_BUTTON_DOWN,          /**< Joystick button pressed */
    SDL_EVENT_JOYSTICK_BUTTON_UP,            /**< Joystick button released */
    SDL_EVENT_JOYSTICK_ADDED,                /**< A new joystick has been inserted into the system */
    SDL_EVENT_JOYSTICK_REMOVED,              /**< An opened joystick has been removed */
    SDL_EVENT_JOYSTICK_BATTERY_UPDATED,      /**< Joystick battery level change */
    SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,      /**< Joystick update is complete */

    /* Gamepad events */
    SDL_EVENT_GAMEPAD_AXIS_MOTION  = 0x650, /**< Gamepad axis motion */
    SDL_EVENT_GAMEPAD_BUTTON_DOWN,          /**< Gamepad button pressed */
    SDL_EVENT_GAMEPAD_BUTTON_UP,            /**< Gamepad button released */
    SDL_EVENT_GAMEPAD_ADDED,                /**< A new gamepad has been inserted into the system */
    SDL_EVENT_GAMEPAD_REMOVED,              /**< A gamepad has been removed */
    SDL_EVENT_GAMEPAD_REMAPPED,             /**< The gamepad mapping was updated */
    SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,        /**< Gamepad touchpad was touched */
    SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,      /**< Gamepad touchpad finger was moved */
    SDL_EVENT_GAMEPAD_TOUCHPAD_UP,          /**< Gamepad touchpad finger was lifted */
    SDL_EVENT_GAMEPAD_SENSOR_UPDATE,        /**< Gamepad sensor was updated */
    SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,      /**< Gamepad update is complete */
    SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,  /**< Gamepad Steam handle has changed */

    /* Touch events */
    SDL_EVENT_FINGER_DOWN      = 0x700,
    SDL_EVENT_FINGER_UP,
    SDL_EVENT_FINGER_MOTION,

    /* 0x800, 0x801, and 0x802 were the Gesture events from SDL2. Do not reuse these values! sdl2-compat needs them! */

    /* Clipboard events */
    SDL_EVENT_CLIPBOARD_UPDATE = 0x900, /**< The clipboard or primary selection changed */

    /* Drag and drop events */
    SDL_EVENT_DROP_FILE        = 0x1000, /**< The system requests a file open */
    SDL_EVENT_DROP_TEXT,                 /**< text/plain drag-and-drop event */
    SDL_EVENT_DROP_BEGIN,                /**< A new set of drops is beginning (NULL filename) */
    SDL_EVENT_DROP_COMPLETE,             /**< Current set of drops is now complete (NULL filename) */
    SDL_EVENT_DROP_POSITION,             /**< Position while moving over the window */

    /* Audio hotplug events */
    SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100,  /**< A new audio device is available */
    SDL_EVENT_AUDIO_DEVICE_REMOVED,         /**< An audio device has been removed. */
    SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,  /**< An audio device's format has been changed by the system. */

    /* Sensor events */
    SDL_EVENT_SENSOR_UPDATE = 0x1200,     /**< A sensor was updated */

    /* Pressure-sensitive pen events */
    SDL_EVENT_PEN_PROXIMITY_IN = 0x1300,  /**< Pressure-sensitive pen has become available */
    SDL_EVENT_PEN_PROXIMITY_OUT,          /**< Pressure-sensitive pen has become unavailable */
    SDL_EVENT_PEN_DOWN,                   /**< Pressure-sensitive pen touched drawing surface */
    SDL_EVENT_PEN_UP,                     /**< Pressure-sensitive pen stopped touching drawing surface */
    SDL_EVENT_PEN_BUTTON_DOWN,            /**< Pressure-sensitive pen button pressed */
    SDL_EVENT_PEN_BUTTON_UP,              /**< Pressure-sensitive pen button released */
    SDL_EVENT_PEN_MOTION,                 /**< Pressure-sensitive pen is moving on the tablet */
    SDL_EVENT_PEN_AXIS,                   /**< Pressure-sensitive pen angle/pressure/etc changed */

    /* Camera hotplug events */
    SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1400,  /**< A new camera device is available */
    SDL_EVENT_CAMERA_DEVICE_REMOVED,         /**< A camera device has been removed. */
    SDL_EVENT_CAMERA_DEVICE_APPROVED,        /**< A camera device has been approved for use by the user. */
    SDL_EVENT_CAMERA_DEVICE_DENIED,          /**< A camera device has been denied for use by the user. */

    /* Render events */
    SDL_EVENT_RENDER_TARGETS_RESET = 0x2000, /**< The render targets have been reset and their contents need to be updated */
    SDL_EVENT_RENDER_DEVICE_RESET, /**< The device has been reset and all textures need to be recreated */
    SDL_EVENT_RENDER_DEVICE_LOST, /**< The device has been lost and can't be recovered. */

    /* Reserved events for private platforms */
    SDL_EVENT_PRIVATE0 = 0x4000,
    SDL_EVENT_PRIVATE1,
    SDL_EVENT_PRIVATE2,
    SDL_EVENT_PRIVATE3,

    /* Internal events */
    SDL_EVENT_POLL_SENTINEL = 0x7F00, /**< Signals the end of an event poll cycle */

    /** Events SDL_EVENT_USER through SDL_EVENT_LAST are for your use,
     *  and should be allocated with SDL_RegisterEvents()
     */
    SDL_EVENT_USER    = 0x8000,

    /**
     *  This last event is only for bounding internal arrays
     */
    SDL_EVENT_LAST    = 0xFFFF,

    /* This just makes sure the enum is the size of uint */
    SDL_EVENT_ENUM_PADDING = 0x7FFFFFFF,
}


struct SDL_CommonEvent {
    SDL_EventType type; // Documentation says uint but SDL_EventType *is* a uint.
    uint reserved;
    ulong timestamp;
}

alias SDL_DisplayID = uint;

struct SDL_DisplayEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_DisplayID displayID;
    uint data1;
    uint data2;
}

alias SDL_WindowID = uint;

struct SDL_WindowEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_WindowID windowID;
    int data;
    int data2;
}

alias SDL_KeyboardID = uint;

struct SDL_KeyboardDeviceEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_KeyboardID which;
}

alias SDL_Scancode = int;

enum : SDL_Scancode
{
    SDL_SCANCODE_UNKNOWN = 0,

    /**
     *  \name Usage page 0x07
     *
     *  These values are from usage page 0x07 (USB keyboard page).
     */
    /* @{ */

    SDL_SCANCODE_A = 4,
    SDL_SCANCODE_B = 5,
    SDL_SCANCODE_C = 6,
    SDL_SCANCODE_D = 7,
    SDL_SCANCODE_E = 8,
    SDL_SCANCODE_F = 9,
    SDL_SCANCODE_G = 10,
    SDL_SCANCODE_H = 11,
    SDL_SCANCODE_I = 12,
    SDL_SCANCODE_J = 13,
    SDL_SCANCODE_K = 14,
    SDL_SCANCODE_L = 15,
    SDL_SCANCODE_M = 16,
    SDL_SCANCODE_N = 17,
    SDL_SCANCODE_O = 18,
    SDL_SCANCODE_P = 19,
    SDL_SCANCODE_Q = 20,
    SDL_SCANCODE_R = 21,
    SDL_SCANCODE_S = 22,
    SDL_SCANCODE_T = 23,
    SDL_SCANCODE_U = 24,
    SDL_SCANCODE_V = 25,
    SDL_SCANCODE_W = 26,
    SDL_SCANCODE_X = 27,
    SDL_SCANCODE_Y = 28,
    SDL_SCANCODE_Z = 29,

    SDL_SCANCODE_1 = 30,
    SDL_SCANCODE_2 = 31,
    SDL_SCANCODE_3 = 32,
    SDL_SCANCODE_4 = 33,
    SDL_SCANCODE_5 = 34,
    SDL_SCANCODE_6 = 35,
    SDL_SCANCODE_7 = 36,
    SDL_SCANCODE_8 = 37,
    SDL_SCANCODE_9 = 38,
    SDL_SCANCODE_0 = 39,

    SDL_SCANCODE_RETURN = 40,
    SDL_SCANCODE_ESCAPE = 41,
    SDL_SCANCODE_BACKSPACE = 42,
    SDL_SCANCODE_TAB = 43,
    SDL_SCANCODE_SPACE = 44,

    SDL_SCANCODE_MINUS = 45,
    SDL_SCANCODE_EQUALS = 46,
    SDL_SCANCODE_LEFTBRACKET = 47,
    SDL_SCANCODE_RIGHTBRACKET = 48,
    SDL_SCANCODE_BACKSLASH = 49, /**< Located at the lower left of the return
                                  *   key on ISO keyboards and at the right end
                                  *   of the QWERTY row on ANSI keyboards.
                                  *   Produces REVERSE SOLIDUS (backslash) and
                                  *   VERTICAL LINE in a US layout, REVERSE
                                  *   SOLIDUS and VERTICAL LINE in a UK Mac
                                  *   layout, NUMBER SIGN and TILDE in a UK
                                  *   Windows layout, DOLLAR SIGN and POUND SIGN
                                  *   in a Swiss German layout, NUMBER SIGN and
                                  *   APOSTROPHE in a German layout, GRAVE
                                  *   ACCENT and POUND SIGN in a French Mac
                                  *   layout, and ASTERISK and MICRO SIGN in a
                                  *   French Windows layout.
                                  */
    SDL_SCANCODE_NONUSHASH = 50, /**< ISO USB keyboards actually use this code
                                  *   instead of 49 for the same key, but all
                                  *   OSes I've seen treat the two codes
                                  *   identically. So, as an implementor, unless
                                  *   your keyboard generates both of those
                                  *   codes and your OS treats them differently,
                                  *   you should generate SDL_SCANCODE_BACKSLASH
                                  *   instead of this code. As a user, you
                                  *   should not rely on this code because SDL
                                  *   will never generate it with most (all?)
                                  *   keyboards.
                                  */
    SDL_SCANCODE_SEMICOLON = 51,
    SDL_SCANCODE_APOSTROPHE = 52,
    SDL_SCANCODE_GRAVE = 53, /**< Located in the top left corner (on both ANSI
                              *   and ISO keyboards). Produces GRAVE ACCENT and
                              *   TILDE in a US Windows layout and in US and UK
                              *   Mac layouts on ANSI keyboards, GRAVE ACCENT
                              *   and NOT SIGN in a UK Windows layout, SECTION
                              *   SIGN and PLUS-MINUS SIGN in US and UK Mac
                              *   layouts on ISO keyboards, SECTION SIGN and
                              *   DEGREE SIGN in a Swiss German layout (Mac:
                              *   only on ISO keyboards), CIRCUMFLEX ACCENT and
                              *   DEGREE SIGN in a German layout (Mac: only on
                              *   ISO keyboards), SUPERSCRIPT TWO and TILDE in a
                              *   French Windows layout, COMMERCIAL AT and
                              *   NUMBER SIGN in a French Mac layout on ISO
                              *   keyboards, and LESS-THAN SIGN and GREATER-THAN
                              *   SIGN in a Swiss German, German, or French Mac
                              *   layout on ANSI keyboards.
                              */
    SDL_SCANCODE_COMMA = 54,
    SDL_SCANCODE_PERIOD = 55,
    SDL_SCANCODE_SLASH = 56,

    SDL_SCANCODE_CAPSLOCK = 57,

    SDL_SCANCODE_F1 = 58,
    SDL_SCANCODE_F2 = 59,
    SDL_SCANCODE_F3 = 60,
    SDL_SCANCODE_F4 = 61,
    SDL_SCANCODE_F5 = 62,
    SDL_SCANCODE_F6 = 63,
    SDL_SCANCODE_F7 = 64,
    SDL_SCANCODE_F8 = 65,
    SDL_SCANCODE_F9 = 66,
    SDL_SCANCODE_F10 = 67,
    SDL_SCANCODE_F11 = 68,
    SDL_SCANCODE_F12 = 69,

    SDL_SCANCODE_PRINTSCREEN = 70,
    SDL_SCANCODE_SCROLLLOCK = 71,
    SDL_SCANCODE_PAUSE = 72,
    SDL_SCANCODE_INSERT = 73, /**< insert on PC, help on some Mac keyboards (but
                                   does send code 73, not 117) */
    SDL_SCANCODE_HOME = 74,
    SDL_SCANCODE_PAGEUP = 75,
    SDL_SCANCODE_DELETE = 76,
    SDL_SCANCODE_END = 77,
    SDL_SCANCODE_PAGEDOWN = 78,
    SDL_SCANCODE_RIGHT = 79,
    SDL_SCANCODE_LEFT = 80,
    SDL_SCANCODE_DOWN = 81,
    SDL_SCANCODE_UP = 82,

    SDL_SCANCODE_NUMLOCKCLEAR = 83, /**< num lock on PC, clear on Mac keyboards
                                     */
    SDL_SCANCODE_KP_DIVIDE = 84,
    SDL_SCANCODE_KP_MULTIPLY = 85,
    SDL_SCANCODE_KP_MINUS = 86,
    SDL_SCANCODE_KP_PLUS = 87,
    SDL_SCANCODE_KP_ENTER = 88,
    SDL_SCANCODE_KP_1 = 89,
    SDL_SCANCODE_KP_2 = 90,
    SDL_SCANCODE_KP_3 = 91,
    SDL_SCANCODE_KP_4 = 92,
    SDL_SCANCODE_KP_5 = 93,
    SDL_SCANCODE_KP_6 = 94,
    SDL_SCANCODE_KP_7 = 95,
    SDL_SCANCODE_KP_8 = 96,
    SDL_SCANCODE_KP_9 = 97,
    SDL_SCANCODE_KP_0 = 98,
    SDL_SCANCODE_KP_PERIOD = 99,

    SDL_SCANCODE_NONUSBACKSLASH = 100, /**< This is the additional key that ISO
                                        *   keyboards have over ANSI ones,
                                        *   located between left shift and Y.
                                        *   Produces GRAVE ACCENT and TILDE in a
                                        *   US or UK Mac layout, REVERSE SOLIDUS
                                        *   (backslash) and VERTICAL LINE in a
                                        *   US or UK Windows layout, and
                                        *   LESS-THAN SIGN and GREATER-THAN SIGN
                                        *   in a Swiss German, German, or French
                                        *   layout. */
    SDL_SCANCODE_APPLICATION = 101, /**< windows contextual menu, compose */
    SDL_SCANCODE_POWER = 102, /**< The USB document says this is a status flag,
                               *   not a physical key - but some Mac keyboards
                               *   do have a power key. */
    SDL_SCANCODE_KP_EQUALS = 103,
    SDL_SCANCODE_F13 = 104,
    SDL_SCANCODE_F14 = 105,
    SDL_SCANCODE_F15 = 106,
    SDL_SCANCODE_F16 = 107,
    SDL_SCANCODE_F17 = 108,
    SDL_SCANCODE_F18 = 109,
    SDL_SCANCODE_F19 = 110,
    SDL_SCANCODE_F20 = 111,
    SDL_SCANCODE_F21 = 112,
    SDL_SCANCODE_F22 = 113,
    SDL_SCANCODE_F23 = 114,
    SDL_SCANCODE_F24 = 115,
    SDL_SCANCODE_EXECUTE = 116,
    SDL_SCANCODE_HELP = 117,    /**< AL Integrated Help Center */
    SDL_SCANCODE_MENU = 118,    /**< Menu (show menu) */
    SDL_SCANCODE_SELECT = 119,
    SDL_SCANCODE_STOP = 120,    /**< AC Stop */
    SDL_SCANCODE_AGAIN = 121,   /**< AC Redo/Repeat */
    SDL_SCANCODE_UNDO = 122,    /**< AC Undo */
    SDL_SCANCODE_CUT = 123,     /**< AC Cut */
    SDL_SCANCODE_COPY = 124,    /**< AC Copy */
    SDL_SCANCODE_PASTE = 125,   /**< AC Paste */
    SDL_SCANCODE_FIND = 126,    /**< AC Find */
    SDL_SCANCODE_MUTE = 127,
    SDL_SCANCODE_VOLUMEUP = 128,
    SDL_SCANCODE_VOLUMEDOWN = 129,
/* not sure whether there's a reason to enable these */
/*     SDL_SCANCODE_LOCKINGCAPSLOCK = 130,  */
/*     SDL_SCANCODE_LOCKINGNUMLOCK = 131, */
/*     SDL_SCANCODE_LOCKINGSCROLLLOCK = 132, */
    SDL_SCANCODE_KP_COMMA = 133,
    SDL_SCANCODE_KP_EQUALSAS400 = 134,

    SDL_SCANCODE_INTERNATIONAL1 = 135, /**< used on Asian keyboards, see
                                            footnotes in USB doc */
    SDL_SCANCODE_INTERNATIONAL2 = 136,
    SDL_SCANCODE_INTERNATIONAL3 = 137, /**< Yen */
    SDL_SCANCODE_INTERNATIONAL4 = 138,
    SDL_SCANCODE_INTERNATIONAL5 = 139,
    SDL_SCANCODE_INTERNATIONAL6 = 140,
    SDL_SCANCODE_INTERNATIONAL7 = 141,
    SDL_SCANCODE_INTERNATIONAL8 = 142,
    SDL_SCANCODE_INTERNATIONAL9 = 143,
    SDL_SCANCODE_LANG1 = 144, /**< Hangul/English toggle */
    SDL_SCANCODE_LANG2 = 145, /**< Hanja conversion */
    SDL_SCANCODE_LANG3 = 146, /**< Katakana */
    SDL_SCANCODE_LANG4 = 147, /**< Hiragana */
    SDL_SCANCODE_LANG5 = 148, /**< Zenkaku/Hankaku */
    SDL_SCANCODE_LANG6 = 149, /**< reserved */
    SDL_SCANCODE_LANG7 = 150, /**< reserved */
    SDL_SCANCODE_LANG8 = 151, /**< reserved */
    SDL_SCANCODE_LANG9 = 152, /**< reserved */

    SDL_SCANCODE_ALTERASE = 153,    /**< Erase-Eaze */
    SDL_SCANCODE_SYSREQ = 154,
    SDL_SCANCODE_CANCEL = 155,      /**< AC Cancel */
    SDL_SCANCODE_CLEAR = 156,
    SDL_SCANCODE_PRIOR = 157,
    SDL_SCANCODE_RETURN2 = 158,
    SDL_SCANCODE_SEPARATOR = 159,
    SDL_SCANCODE_OUT = 160,
    SDL_SCANCODE_OPER = 161,
    SDL_SCANCODE_CLEARAGAIN = 162,
    SDL_SCANCODE_CRSEL = 163,
    SDL_SCANCODE_EXSEL = 164,

    SDL_SCANCODE_KP_00 = 176,
    SDL_SCANCODE_KP_000 = 177,
    SDL_SCANCODE_THOUSANDSSEPARATOR = 178,
    SDL_SCANCODE_DECIMALSEPARATOR = 179,
    SDL_SCANCODE_CURRENCYUNIT = 180,
    SDL_SCANCODE_CURRENCYSUBUNIT = 181,
    SDL_SCANCODE_KP_LEFTPAREN = 182,
    SDL_SCANCODE_KP_RIGHTPAREN = 183,
    SDL_SCANCODE_KP_LEFTBRACE = 184,
    SDL_SCANCODE_KP_RIGHTBRACE = 185,
    SDL_SCANCODE_KP_TAB = 186,
    SDL_SCANCODE_KP_BACKSPACE = 187,
    SDL_SCANCODE_KP_A = 188,
    SDL_SCANCODE_KP_B = 189,
    SDL_SCANCODE_KP_C = 190,
    SDL_SCANCODE_KP_D = 191,
    SDL_SCANCODE_KP_E = 192,
    SDL_SCANCODE_KP_F = 193,
    SDL_SCANCODE_KP_XOR = 194,
    SDL_SCANCODE_KP_POWER = 195,
    SDL_SCANCODE_KP_PERCENT = 196,
    SDL_SCANCODE_KP_LESS = 197,
    SDL_SCANCODE_KP_GREATER = 198,
    SDL_SCANCODE_KP_AMPERSAND = 199,
    SDL_SCANCODE_KP_DBLAMPERSAND = 200,
    SDL_SCANCODE_KP_VERTICALBAR = 201,
    SDL_SCANCODE_KP_DBLVERTICALBAR = 202,
    SDL_SCANCODE_KP_COLON = 203,
    SDL_SCANCODE_KP_HASH = 204,
    SDL_SCANCODE_KP_SPACE = 205,
    SDL_SCANCODE_KP_AT = 206,
    SDL_SCANCODE_KP_EXCLAM = 207,
    SDL_SCANCODE_KP_MEMSTORE = 208,
    SDL_SCANCODE_KP_MEMRECALL = 209,
    SDL_SCANCODE_KP_MEMCLEAR = 210,
    SDL_SCANCODE_KP_MEMADD = 211,
    SDL_SCANCODE_KP_MEMSUBTRACT = 212,
    SDL_SCANCODE_KP_MEMMULTIPLY = 213,
    SDL_SCANCODE_KP_MEMDIVIDE = 214,
    SDL_SCANCODE_KP_PLUSMINUS = 215,
    SDL_SCANCODE_KP_CLEAR = 216,
    SDL_SCANCODE_KP_CLEARENTRY = 217,
    SDL_SCANCODE_KP_BINARY = 218,
    SDL_SCANCODE_KP_OCTAL = 219,
    SDL_SCANCODE_KP_DECIMAL = 220,
    SDL_SCANCODE_KP_HEXADECIMAL = 221,

    SDL_SCANCODE_LCTRL = 224,
    SDL_SCANCODE_LSHIFT = 225,
    SDL_SCANCODE_LALT = 226, /**< alt, option */
    SDL_SCANCODE_LGUI = 227, /**< windows, command (apple), meta */
    SDL_SCANCODE_RCTRL = 228,
    SDL_SCANCODE_RSHIFT = 229,
    SDL_SCANCODE_RALT = 230, /**< alt gr, option */
    SDL_SCANCODE_RGUI = 231, /**< windows, command (apple), meta */

    SDL_SCANCODE_MODE = 257,    /**< I'm not sure if this is really not covered
                                 *   by any of the above, but since there's a
                                 *   special KMOD_MODE for it I'm adding it here
                                 */

    /* @} *//* Usage page 0x07 */

    /**
     *  \name Usage page 0x0C
     *
     *  These values are mapped from usage page 0x0C (USB consumer page).
     *  See https://usb.org/sites/default/files/hut1_2.pdf
     *
     *  There are way more keys in the spec than we can represent in the
     *  current scancode range, so pick the ones that commonly come up in
     *  real world usage.
     */
    /* @{ */

    SDL_SCANCODE_AUDIONEXT = 258,
    SDL_SCANCODE_AUDIOPREV = 259,
    SDL_SCANCODE_AUDIOSTOP = 260,
    SDL_SCANCODE_AUDIOPLAY = 261,
    SDL_SCANCODE_AUDIOMUTE = 262,
    SDL_SCANCODE_MEDIASELECT = 263,
    SDL_SCANCODE_WWW = 264,             /**< AL Internet Browser */
    SDL_SCANCODE_MAIL = 265,
    SDL_SCANCODE_CALCULATOR = 266,      /**< AL Calculator */
    SDL_SCANCODE_COMPUTER = 267,
    SDL_SCANCODE_AC_SEARCH = 268,       /**< AC Search */
    SDL_SCANCODE_AC_HOME = 269,         /**< AC Home */
    SDL_SCANCODE_AC_BACK = 270,         /**< AC Back */
    SDL_SCANCODE_AC_FORWARD = 271,      /**< AC Forward */
    SDL_SCANCODE_AC_STOP = 272,         /**< AC Stop */
    SDL_SCANCODE_AC_REFRESH = 273,      /**< AC Refresh */
    SDL_SCANCODE_AC_BOOKMARKS = 274,    /**< AC Bookmarks */

    /* @} *//* Usage page 0x0C */

    /**
     *  \name Walther keys
     *
     *  These are values that Christian Walther added (for mac keyboard?).
     */
    /* @{ */

    SDL_SCANCODE_BRIGHTNESSDOWN = 275,
    SDL_SCANCODE_BRIGHTNESSUP = 276,
    SDL_SCANCODE_DISPLAYSWITCH = 277, /**< display mirroring/dual display
                                           switch, video mode switch */
    SDL_SCANCODE_KBDILLUMTOGGLE = 278,
    SDL_SCANCODE_KBDILLUMDOWN = 279,
    SDL_SCANCODE_KBDILLUMUP = 280,
    SDL_SCANCODE_EJECT = 281,
    SDL_SCANCODE_SLEEP = 282,           /**< SC System Sleep */

    SDL_SCANCODE_APP1 = 283,
    SDL_SCANCODE_APP2 = 284,

    /* @} *//* Walther keys */

    /**
     *  \name Usage page 0x0C (additional media keys)
     *
     *  These values are mapped from usage page 0x0C (USB consumer page).
     */
    /* @{ */

    SDL_SCANCODE_AUDIOREWIND = 285,
    SDL_SCANCODE_AUDIOFASTFORWARD = 286,

    /* @} *//* Usage page 0x0C (additional media keys) */

    /**
     *  \name Mobile keys
     *
     *  These are values that are often used on mobile phones.
     */
    /* @{ */

    SDL_SCANCODE_SOFTLEFT = 287, /**< Usually situated below the display on phones and
                                      used as a multi-function feature key for selecting
                                      a software defined function shown on the bottom left
                                      of the display. */
    SDL_SCANCODE_SOFTRIGHT = 288, /**< Usually situated below the display on phones and
                                       used as a multi-function feature key for selecting
                                       a software defined function shown on the bottom right
                                       of the display. */
    SDL_SCANCODE_CALL = 289, /**< Used for accepting phone calls. */
    SDL_SCANCODE_ENDCALL = 290, /**< Used for rejecting phone calls. */

    /* @} *//* Mobile keys */

    /* Add any other keys here. */

    SDL_NUM_SCANCODES = 512 /**< not a key, just marks the number of scancodes
                                 for array bounds */
}

alias SDL_Keycode = uint;

private
auto SDL_SCANCODE_TO_KEYCODE (T) (T X) {
    return X | SDLK_SCANCODE_MASK;
}

enum : SDL_Keycode
{
    SDLK_SCANCODE_MASK         = (1u<<30),
    SDLK_UNKNOWN               = 0x00000000u /**< 0 */,
    SDLK_RETURN                = 0x0000000du /**< '\r' */,
    SDLK_ESCAPE                = 0x0000001bu /**< '\x1B' */,
    SDLK_BACKSPACE             = 0x00000008u /**< '\b' */,
    SDLK_TAB                   = 0x00000009u /**< '\t' */,
    SDLK_SPACE                 = 0x00000020u /**< ' ' */,
    SDLK_EXCLAIM               = 0x00000021u /**< '!' */,
    SDLK_DBLAPOSTROPHE         = 0x00000022u /**< '"' */,
    SDLK_HASH                  = 0x00000023u /**< '#' */,
    SDLK_DOLLAR                = 0x00000024u /**< '$' */,
    SDLK_PERCENT               = 0x00000025u /**< '%' */,
    SDLK_AMPERSAND             = 0x00000026u /**< '&' */,
    SDLK_APOSTROPHE            = 0x00000027u /**< '\'' */,
    SDLK_LEFTPAREN             = 0x00000028u /**< '(' */,
    SDLK_RIGHTPAREN            = 0x00000029u /**< ')' */,
    SDLK_ASTERISK              = 0x0000002au /**< '*' */,
    SDLK_PLUS                  = 0x0000002bu /**< '+' */,
    SDLK_COMMA                 = 0x0000002cu /**< ',' */,
    SDLK_MINUS                 = 0x0000002du /**< '-' */,
    SDLK_PERIOD                = 0x0000002eu /**< '.' */,
    SDLK_SLASH                 = 0x0000002fu /**< '/' */,
    SDLK_0                     = 0x00000030u /**< '0' */,
    SDLK_1                     = 0x00000031u /**< '1' */,
    SDLK_2                     = 0x00000032u /**< '2' */,
    SDLK_3                     = 0x00000033u /**< '3' */,
    SDLK_4                     = 0x00000034u /**< '4' */,
    SDLK_5                     = 0x00000035u /**< '5' */,
    SDLK_6                     = 0x00000036u /**< '6' */,
    SDLK_7                     = 0x00000037u /**< '7' */,
    SDLK_8                     = 0x00000038u /**< '8' */,
    SDLK_9                     = 0x00000039u /**< '9' */,
    SDLK_COLON                 = 0x0000003au /**< ':' */,
    SDLK_SEMICOLON             = 0x0000003bu /**< ';' */,
    SDLK_LESS                  = 0x0000003cu /**< '<' */,
    SDLK_EQUALS                = 0x0000003du /**< '=' */,
    SDLK_GREATER               = 0x0000003eu /**< '>' */,
    SDLK_QUESTION              = 0x0000003fu /**< '?' */,
    SDLK_AT                    = 0x00000040u /**< '@' */,
    SDLK_LEFTBRACKET           = 0x0000005bu /**< '[' */,
    SDLK_BACKSLASH             = 0x0000005cu /**< '\\' */,
    SDLK_RIGHTBRACKET          = 0x0000005du /**< ']' */,
    SDLK_CARET                 = 0x0000005eu /**< '^' */,
    SDLK_UNDERSCORE            = 0x0000005fu /**< '_' */,
    SDLK_GRAVE                 = 0x00000060u /**< '`' */,
    SDLK_A                     = 0x00000061u /**< 'a' */,
    SDLK_B                     = 0x00000062u /**< 'b' */,
    SDLK_C                     = 0x00000063u /**< 'c' */,
    SDLK_D                     = 0x00000064u /**< 'd' */,
    SDLK_E                     = 0x00000065u /**< 'e' */,
    SDLK_F                     = 0x00000066u /**< 'f' */,
    SDLK_G                     = 0x00000067u /**< 'g' */,
    SDLK_H                     = 0x00000068u /**< 'h' */,
    SDLK_I                     = 0x00000069u /**< 'i' */,
    SDLK_J                     = 0x0000006au /**< 'j' */,
    SDLK_K                     = 0x0000006bu /**< 'k' */,
    SDLK_L                     = 0x0000006cu /**< 'l' */,
    SDLK_M                     = 0x0000006du /**< 'm' */,
    SDLK_N                     = 0x0000006eu /**< 'n' */,
    SDLK_O                     = 0x0000006fu /**< 'o' */,
    SDLK_P                     = 0x00000070u /**< 'p' */,
    SDLK_Q                     = 0x00000071u /**< 'q' */,
    SDLK_R                     = 0x00000072u /**< 'r' */,
    SDLK_S                     = 0x00000073u /**< 's' */,
    SDLK_T                     = 0x00000074u /**< 't' */,
    SDLK_U                     = 0x00000075u /**< 'u' */,
    SDLK_V                     = 0x00000076u /**< 'v' */,
    SDLK_W                     = 0x00000077u /**< 'w' */,
    SDLK_X                     = 0x00000078u /**< 'x' */,
    SDLK_Y                     = 0x00000079u /**< 'y' */,
    SDLK_Z                     = 0x0000007au /**< 'z' */,
    SDLK_LEFTBRACE             = 0x0000007bu /**< '{' */,
    SDLK_PIPE                  = 0x0000007cu /**< '|' */,
    SDLK_RIGHTBRACE            = 0x0000007du /**< '}' */,
    SDLK_TILDE                 = 0x0000007eu /**< '~' */,
    SDLK_DELETE                = 0x0000007fu /**< '\x7F' */,
    SDLK_PLUSMINUS             = 0x000000b1u /**< '\xB1' */,
    SDLK_CAPSLOCK              = 0x40000039u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CAPSLOCK) */,
    SDLK_F1                    = 0x4000003au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F1) */,
    SDLK_F2                    = 0x4000003bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F2) */,
    SDLK_F3                    = 0x4000003cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F3) */,
    SDLK_F4                    = 0x4000003du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F4) */,
    SDLK_F5                    = 0x4000003eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F5) */,
    SDLK_F6                    = 0x4000003fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F6) */,
    SDLK_F7                    = 0x40000040u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F7) */,
    SDLK_F8                    = 0x40000041u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F8) */,
    SDLK_F9                    = 0x40000042u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F9) */,
    SDLK_F10                   = 0x40000043u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F10) */,
    SDLK_F11                   = 0x40000044u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F11) */,
    SDLK_F12                   = 0x40000045u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F12) */,
    SDLK_PRINTSCREEN           = 0x40000046u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRINTSCREEN) */,
    SDLK_SCROLLLOCK            = 0x40000047u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SCROLLLOCK) */,
    SDLK_PAUSE                 = 0x40000048u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAUSE) */,
    SDLK_INSERT                = 0x40000049u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_INSERT) */,
    SDLK_HOME                  = 0x4000004au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HOME) */,
    SDLK_PAGEUP                = 0x4000004bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEUP) */,
    SDLK_END                   = 0x4000004du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_END) */,
    SDLK_PAGEDOWN              = 0x4000004eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEDOWN) */,
    SDLK_RIGHT                 = 0x4000004fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RIGHT) */,
    SDLK_LEFT                  = 0x40000050u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LEFT) */,
    SDLK_DOWN                  = 0x40000051u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DOWN) */,
    SDLK_UP                    = 0x40000052u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UP) */,
    SDLK_NUMLOCKCLEAR          = 0x40000053u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_NUMLOCKCLEAR) */,
    SDLK_KP_DIVIDE             = 0x40000054u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DIVIDE) */,
    SDLK_KP_MULTIPLY           = 0x40000055u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MULTIPLY) */,
    SDLK_KP_MINUS              = 0x40000056u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MINUS) */,
    SDLK_KP_PLUS               = 0x40000057u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUS) */,
    SDLK_KP_ENTER              = 0x40000058u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_ENTER) */,
    SDLK_KP_1                  = 0x40000059u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_1) */,
    SDLK_KP_2                  = 0x4000005au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_2) */,
    SDLK_KP_3                  = 0x4000005bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_3) */,
    SDLK_KP_4                  = 0x4000005cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_4) */,
    SDLK_KP_5                  = 0x4000005du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_5) */,
    SDLK_KP_6                  = 0x4000005eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_6) */,
    SDLK_KP_7                  = 0x4000005fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_7) */,
    SDLK_KP_8                  = 0x40000060u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_8) */,
    SDLK_KP_9                  = 0x40000061u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_9) */,
    SDLK_KP_0                  = 0x40000062u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_0) */,
    SDLK_KP_PERIOD             = 0x40000063u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERIOD) */,
    SDLK_APPLICATION           = 0x40000065u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APPLICATION) */,
    SDLK_POWER                 = 0x40000066u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_POWER) */,
    SDLK_KP_EQUALS             = 0x40000067u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALS) */,
    SDLK_F13                   = 0x40000068u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F13) */,
    SDLK_F14                   = 0x40000069u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F14) */,
    SDLK_F15                   = 0x4000006au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F15) */,
    SDLK_F16                   = 0x4000006bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F16) */,
    SDLK_F17                   = 0x4000006cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F17) */,
    SDLK_F18                   = 0x4000006du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F18) */,
    SDLK_F19                   = 0x4000006eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F19) */,
    SDLK_F20                   = 0x4000006fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F20) */,
    SDLK_F21                   = 0x40000070u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F21) */,
    SDLK_F22                   = 0x40000071u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F22) */,
    SDLK_F23                   = 0x40000072u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F23) */,
    SDLK_F24                   = 0x40000073u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F24) */,
    SDLK_EXECUTE               = 0x40000074u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXECUTE) */,
    SDLK_HELP                  = 0x40000075u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HELP) */,
    SDLK_MENU                  = 0x40000076u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MENU) */,
    SDLK_SELECT                = 0x40000077u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SELECT) */,
    SDLK_STOP                  = 0x40000078u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_STOP) */,
    SDLK_AGAIN                 = 0x40000079u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AGAIN) */,
    SDLK_UNDO                  = 0x4000007au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UNDO) */,
    SDLK_CUT                   = 0x4000007bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CUT) */,
    SDLK_COPY                  = 0x4000007cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COPY) */,
    SDLK_PASTE                 = 0x4000007du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PASTE) */,
    SDLK_FIND                  = 0x4000007eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_FIND) */,
    SDLK_MUTE                  = 0x4000007fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MUTE) */,
    SDLK_VOLUMEUP              = 0x40000080u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEUP) */,
    SDLK_VOLUMEDOWN            = 0x40000081u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEDOWN) */,
    SDLK_KP_COMMA              = 0x40000085u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COMMA) */,
    SDLK_KP_EQUALSAS400        = 0x40000086u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALSAS400) */,
    SDLK_ALTERASE              = 0x40000099u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ALTERASE) */,
    SDLK_SYSREQ                = 0x4000009au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SYSREQ) */,
    SDLK_CANCEL                = 0x4000009bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CANCEL) */,
    SDLK_CLEAR                 = 0x4000009cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEAR) */,
    SDLK_PRIOR                 = 0x4000009du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRIOR) */,
    SDLK_RETURN2               = 0x4000009eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RETURN2) */,
    SDLK_SEPARATOR             = 0x4000009fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SEPARATOR) */,
    SDLK_OUT                   = 0x400000a0u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OUT) */,
    SDLK_OPER                  = 0x400000a1u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OPER) */,
    SDLK_CLEARAGAIN            = 0x400000a2u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEARAGAIN) */,
    SDLK_CRSEL                 = 0x400000a3u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CRSEL) */,
    SDLK_EXSEL                 = 0x400000a4u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXSEL) */,
    SDLK_KP_00                 = 0x400000b0u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_00) */,
    SDLK_KP_000                = 0x400000b1u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_000) */,
    SDLK_THOUSANDSSEPARATOR    = 0x400000b2u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_THOUSANDSSEPARATOR) */,
    SDLK_DECIMALSEPARATOR      = 0x400000b3u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DECIMALSEPARATOR) */,
    SDLK_CURRENCYUNIT          = 0x400000b4u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYUNIT) */,
    SDLK_CURRENCYSUBUNIT       = 0x400000b5u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYSUBUNIT) */,
    SDLK_KP_LEFTPAREN          = 0x400000b6u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTPAREN) */,
    SDLK_KP_RIGHTPAREN         = 0x400000b7u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTPAREN) */,
    SDLK_KP_LEFTBRACE          = 0x400000b8u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTBRACE) */,
    SDLK_KP_RIGHTBRACE         = 0x400000b9u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTBRACE) */,
    SDLK_KP_TAB                = 0x400000bau /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_TAB) */,
    SDLK_KP_BACKSPACE          = 0x400000bbu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BACKSPACE) */,
    SDLK_KP_A                  = 0x400000bcu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_A) */,
    SDLK_KP_B                  = 0x400000bdu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_B) */,
    SDLK_KP_C                  = 0x400000beu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_C) */,
    SDLK_KP_D                  = 0x400000bfu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_D) */,
    SDLK_KP_E                  = 0x400000c0u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_E) */,
    SDLK_KP_F                  = 0x400000c1u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_F) */,
    SDLK_KP_XOR                = 0x400000c2u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_XOR) */,
    SDLK_KP_POWER              = 0x400000c3u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_POWER) */,
    SDLK_KP_PERCENT            = 0x400000c4u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERCENT) */,
    SDLK_KP_LESS               = 0x400000c5u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LESS) */,
    SDLK_KP_GREATER            = 0x400000c6u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_GREATER) */,
    SDLK_KP_AMPERSAND          = 0x400000c7u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AMPERSAND) */,
    SDLK_KP_DBLAMPERSAND       = 0x400000c8u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLAMPERSAND) */,
    SDLK_KP_VERTICALBAR        = 0x400000c9u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_VERTICALBAR) */,
    SDLK_KP_DBLVERTICALBAR     = 0x400000cau /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLVERTICALBAR) */,
    SDLK_KP_COLON              = 0x400000cbu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COLON) */,
    SDLK_KP_HASH               = 0x400000ccu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HASH) */,
    SDLK_KP_SPACE              = 0x400000cdu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_SPACE) */,
    SDLK_KP_AT                 = 0x400000ceu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AT) */,
    SDLK_KP_EXCLAM             = 0x400000cfu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EXCLAM) */,
    SDLK_KP_MEMSTORE           = 0x400000d0u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSTORE) */,
    SDLK_KP_MEMRECALL          = 0x400000d1u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMRECALL) */,
    SDLK_KP_MEMCLEAR           = 0x400000d2u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMCLEAR) */,
    SDLK_KP_MEMADD             = 0x400000d3u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMADD) */,
    SDLK_KP_MEMSUBTRACT        = 0x400000d4u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSUBTRACT) */,
    SDLK_KP_MEMMULTIPLY        = 0x400000d5u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMMULTIPLY) */,
    SDLK_KP_MEMDIVIDE          = 0x400000d6u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMDIVIDE) */,
    SDLK_KP_PLUSMINUS          = 0x400000d7u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUSMINUS) */,
    SDLK_KP_CLEAR              = 0x400000d8u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEAR) */,
    SDLK_KP_CLEARENTRY         = 0x400000d9u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEARENTRY) */,
    SDLK_KP_BINARY             = 0x400000dau /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BINARY) */,
    SDLK_KP_OCTAL              = 0x400000dbu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_OCTAL) */,
    SDLK_KP_DECIMAL            = 0x400000dcu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DECIMAL) */,
    SDLK_KP_HEXADECIMAL        = 0x400000ddu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HEXADECIMAL) */,
    SDLK_LCTRL                 = 0x400000e0u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LCTRL) */,
    SDLK_LSHIFT                = 0x400000e1u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LSHIFT) */,
    SDLK_LALT                  = 0x400000e2u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LALT) */,
    SDLK_LGUI                  = 0x400000e3u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LGUI) */,
    SDLK_RCTRL                 = 0x400000e4u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RCTRL) */,
    SDLK_RSHIFT                = 0x400000e5u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RSHIFT) */,
    SDLK_RALT                  = 0x400000e6u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RALT) */,
    SDLK_RGUI                  = 0x400000e7u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RGUI) */,
    SDLK_MODE                  = 0x40000101u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MODE) */,
    SDLK_SLEEP                 = 0x40000102u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SLEEP) */,
    SDLK_WAKE                  = 0x40000103u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_WAKE) */,
    SDLK_CHANNEL_INCREMENT     = 0x40000104u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CHANNEL_INCREMENT) */,
    SDLK_CHANNEL_DECREMENT     = 0x40000105u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CHANNEL_DECREMENT) */,
    SDLK_MEDIA_PLAY            = 0x40000106u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PLAY) */,
    SDLK_MEDIA_PAUSE           = 0x40000107u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PAUSE) */,
    SDLK_MEDIA_RECORD          = 0x40000108u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_RECORD) */,
    SDLK_MEDIA_FAST_FORWARD    = 0x40000109u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_FAST_FORWARD) */,
    SDLK_MEDIA_REWIND          = 0x4000010au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_REWIND) */,
    SDLK_MEDIA_NEXT_TRACK      = 0x4000010bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_NEXT_TRACK) */,
    SDLK_MEDIA_PREVIOUS_TRACK  = 0x4000010cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PREVIOUS_TRACK) */,
    SDLK_MEDIA_STOP            = 0x4000010du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_STOP) */,
    SDLK_MEDIA_EJECT           = 0x4000010eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_EJECT) */,
    SDLK_MEDIA_PLAY_PAUSE      = 0x4000010fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_PLAY_PAUSE) */,
    SDLK_MEDIA_SELECT          = 0x40000110u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIA_SELECT) */,
    SDLK_AC_NEW                = 0x40000111u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_NEW) */,
    SDLK_AC_OPEN               = 0x40000112u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_OPEN) */,
    SDLK_AC_CLOSE              = 0x40000113u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_CLOSE) */,
    SDLK_AC_EXIT               = 0x40000114u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_EXIT) */,
    SDLK_AC_SAVE               = 0x40000115u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SAVE) */,
    SDLK_AC_PRINT              = 0x40000116u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_PRINT) */,
    SDLK_AC_PROPERTIES         = 0x40000117u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_PROPERTIES) */,
    SDLK_AC_SEARCH             = 0x40000118u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SEARCH) */,
    SDLK_AC_HOME               = 0x40000119u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_HOME) */,
    SDLK_AC_BACK               = 0x4000011au /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BACK) */,
    SDLK_AC_FORWARD            = 0x4000011bu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_FORWARD) */,
    SDLK_AC_STOP               = 0x4000011cu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_STOP) */,
    SDLK_AC_REFRESH            = 0x4000011du /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_REFRESH) */,
    SDLK_AC_BOOKMARKS          = 0x4000011eu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BOOKMARKS) */,
    SDLK_SOFTLEFT              = 0x4000011fu /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SOFTLEFT) */,
    SDLK_SOFTRIGHT             = 0x40000120u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SOFTRIGHT) */,
    SDLK_CALL                  = 0x40000121u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CALL) */,
    SDLK_ENDCALL               = 0x40000122u /**< SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ENDCALL) */,
}

alias SDL_Keymod = ushort;

enum : SDL_Keymod
{
    SDL_KMOD_NONE =   0x0000u /**< no modifier is applicable. */,
    SDL_KMOD_LSHIFT = 0x0001u /**< the left Shift key is down. */,
    SDL_KMOD_RSHIFT = 0x0002u /**< the right Shift key is down. */,
    SDL_KMOD_LCTRL =  0x0040u /**< the left Ctrl (Control) key is down. */,
    SDL_KMOD_RCTRL =  0x0080u /**< the right Ctrl (Control) key is down. */,
    SDL_KMOD_LALT =   0x0100u /**< the left Alt key is down. */,
    SDL_KMOD_RALT =   0x0200u /**< the right Alt key is down. */,
    SDL_KMOD_LGUI =   0x0400u /**< the left GUI key (often the Windows key) is down. */,
    SDL_KMOD_RGUI =   0x0800u /**< the right GUI key (often the Windows key) is down. */,
    SDL_KMOD_NUM  =   0x1000u /**< the Num Lock key (may be located on an extended keypad) is down. */,
    SDL_KMOD_CAPS =   0x2000u /**< the Caps Lock key is down. */,
    SDL_KMOD_MODE =   0x4000u /**< the !AltGr key is down. */,
    SDL_KMOD_SCROLL = 0x8000u /**< the Scroll Lock key is down. */,
    SDL_KMOD_CTRL =   (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)   /**< Any Ctrl key is down. */,
    SDL_KMOD_SHIFT =  (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT) /**< Any Shift key is down. */,
    SDL_KMOD_ALT =    (SDL_KMOD_LALT | SDL_KMOD_RALT)     /**< Any Alt key is down. */,
    SDL_KMOD_GUI =    (SDL_KMOD_LGUI | SDL_KMOD_RGUI)     /**< Any GUI key is down. */,
}

struct SDL_KeyboardEvent {
    SDL_EventType type;     /**< SDL_EVENT_KEY_DOWN or SDL_EVENT_KEY_UP */
    uint reserved;
    ulong timestamp;       /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID;  /**< The window with keyboard focus, if any */
    SDL_KeyboardID which;   /**< The keyboard instance id, or 0 if unknown or virtual */
    SDL_Scancode scancode;  /**< SDL physical key code */
    SDL_Keycode key;        /**< SDL virtual key code */
    SDL_Keymod mod;         /**< current key modifiers */
    ushort raw;             /**< The platform dependent scancode for this event */
    bool down;              /**< true if the key is pressed */
    bool repeat;            /**< true if this is a key repeat */
}

struct SDL_TextEditingEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_WindowID windowID;
    const(char)* text;
    int start;
    int length;
}

struct SDL_TextEditingCandidatesEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_WindowID windowID;
    const(char**) candidates;
    int num_candidates;
    int selected_candidate;
    bool horizontal;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
}

struct SDL_TextInputEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_WindowID windowID;
    const(char)* text;
}

alias SDL_MouseID = uint;

struct SDL_MouseDeviceEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_MouseID which;
}

alias SDL_MouseButtonFlags = uint;

auto SDL_BUTTON_MASK (X) (X x) {
    return 1u << (x - 1);
}

enum : SDL_MouseButtonFlags
{
    SDL_BUTTON_LEFT     = 1,
    SDL_BUTTON_MIDDLE   = 2,
    SDL_BUTTON_RIGHT    = 3,
    SDL_BUTTON_X1       = 4,
    SDL_BUTTON_X2       = 5,

    SDL_BUTTON_LMASK    = SDL_BUTTON_MASK(SDL_BUTTON_LEFT),
    SDL_BUTTON_MMASK    = SDL_BUTTON_MASK(SDL_BUTTON_MIDDLE),
    SDL_BUTTON_RMASK    = SDL_BUTTON_MASK(SDL_BUTTON_RIGHT),
    SDL_BUTTON_X1MASK   = SDL_BUTTON_MASK(SDL_BUTTON_X1),
    SDL_BUTTON_X2MASK   = SDL_BUTTON_MASK(SDL_BUTTON_X2),
}

struct SDL_MouseMotionEvent {
    SDL_EventType type;
    uint reserved;
    ulong timestamp;
    SDL_WindowID windowID;
    SDL_MouseID which;
    SDL_MouseButtonFlags state;
    float x;
    float y;
    float xrel;
    float yrel;
}

struct SDL_MouseButtonEvent {
    SDL_EventType type; /**< SDL_EVENT_MOUSE_BUTTON_DOWN or SDL_EVENT_MOUSE_BUTTON_UP */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window with mouse focus, if any */
    SDL_MouseID which;  /**< The mouse instance id in relative mode, SDL_TOUCH_MOUSEID for touch events, or 0 */
    ubyte button;       /**< The mouse button index */
    bool down;          /**< true if the button is pressed */
    ubyte clicks;       /**< 1 for single-click, 2 for double-click, etc. */
    ubyte padding;
    float x;            /**< X coordinate, relative to window */
    float y;            /**< Y coordinate, relative to window */
}

alias SDL_MouseWheelDirection = int;

enum : SDL_MouseWheelDirection
{
    SDL_MOUSEWHEEL_NORMAL,    /**< The scroll direction is normal */
    SDL_MOUSEWHEEL_FLIPPED,    /**< The scroll direction is flipped / natural */
}

struct SDL_MouseWheelEvent {
    SDL_EventType type; /**< SDL_EVENT_MOUSE_WHEEL */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window with mouse focus, if any */
    SDL_MouseID which;  /**< The mouse instance id in relative mode or 0 */
    float x;            /**< The amount scrolled horizontally, positive to the right and negative to the left */
    float y;            /**< The amount scrolled vertically, positive away from the user and negative toward the user */
    SDL_MouseWheelDirection direction; /**< Set to one of the SDL_MOUSEWHEEL_* defines. When FLIPPED the values in X and Y will be opposite. Multiply by -1 to change them back */
    float mouse_x;      /**< X coordinate, relative to window */
    float mouse_y;      /**< Y coordinate, relative to window */
}

alias SDL_JoystickID = uint;

struct SDL_JoyDeviceEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_ADDED or SDL_EVENT_JOYSTICK_REMOVED or SDL_EVENT_JOYSTICK_UPDATE_COMPLETE */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which;       /**< The joystick instance id */
}

struct SDL_JoyAxisEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_AXIS_MOTION */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    ubyte axis;         /**< The joystick axis index */
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short value;       /**< The axis value (range: -32768 to 32767) */
    ushort padding4;
}

struct SDL_JoyBallEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_BALL_MOTION */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    ubyte ball;         /**< The joystick trackball index */
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short xrel;        /**< The relative motion in the X direction */
    short yrel;        /**< The relative motion in the Y direction */
}

struct SDL_JoyHatEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_HAT_MOTION */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    ubyte hat;          /**< The joystick hat index */
    ubyte value;        /**< The hat position value.
                         *   \sa SDL_HAT_LEFTUP SDL_HAT_UP SDL_HAT_RIGHTUP
                         *   \sa SDL_HAT_LEFT SDL_HAT_CENTERED SDL_HAT_RIGHT
                         *   \sa SDL_HAT_LEFTDOWN SDL_HAT_DOWN SDL_HAT_RIGHTDOWN
                         *
                         *   Note that zero means the POV is centered.
                         */
    ubyte padding1;
    ubyte padding2;
}

struct SDL_JoyButtonEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_BUTTON_DOWN or SDL_EVENT_JOYSTICK_BUTTON_UP */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    ubyte button;       /**< The joystick button index */
    bool down;      /**< true if the button is pressed */
    ubyte padding1;
    ubyte padding2;
}

alias SDL_PowerState = int;

enum : SDL_PowerState
{
    SDL_POWERSTATE_ERROR = -1,   /**< error determining power status */
    SDL_POWERSTATE_UNKNOWN,      /**< cannot determine power status */
    SDL_POWERSTATE_ON_BATTERY,   /**< Not plugged in, running on the battery */
    SDL_POWERSTATE_NO_BATTERY,   /**< Plugged in, no battery available */
    SDL_POWERSTATE_CHARGING,     /**< Plugged in, charging battery */
    SDL_POWERSTATE_CHARGED,       /**< Plugged in, battery charged */
}

struct SDL_JoyBatteryEvent {
    SDL_EventType type; /**< SDL_EVENT_JOYSTICK_BATTERY_UPDATED */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    SDL_PowerState state; /**< The joystick battery state */
    int percent;          /**< The joystick battery percent charge remaining */
}

struct SDL_GamepadDeviceEvent {
    SDL_EventType type; /**< SDL_EVENT_GAMEPAD_ADDED, SDL_EVENT_GAMEPAD_REMOVED, or SDL_EVENT_GAMEPAD_REMAPPED, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE or SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which;       /**< The joystick instance id */
}

struct SDL_GamepadAxisEvent {
    SDL_EventType type; /**< SDL_EVENT_GAMEPAD_AXIS_MOTION */
    uint reserved;
    ulong timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    ubyte axis;         /**< The gamepad axis (SDL_GamepadAxis) */
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short value;       /**< The axis value (range: -32768 to 32767) */
    ushort padding4;
}

struct SDL_GamepadButtonEvent {
    SDL_EventType type; /**< SDL_EVENT_GAMEPAD_AXIS_MOTION */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    Uint8 axis;         /**< The gamepad axis (SDL_GamepadAxis) */
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
    Sint16 value;       /**< The axis value (range: -32768 to 32767) */
    Uint16 padding4;
}

struct SDL_GamepadTouchpadEvent {
    SDL_EventType type; /**< SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN or SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION or SDL_EVENT_GAMEPAD_TOUCHPAD_UP */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    Sint32 touchpad;    /**< The index of the touchpad */
    Sint32 finger;      /**< The index of the finger on the touchpad */
    float x;            /**< Normalized in the range 0...1 with 0 being on the left */
    float y;            /**< Normalized in the range 0...1 with 0 being at the top */
    float pressure;     /**< Normalized in the range 0...1 */
}

struct SDL_GamepadSensorEvent {
    SDL_EventType type; /**< SDL_EVENT_GAMEPAD_SENSOR_UPDATE */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_JoystickID which; /**< The joystick instance id */
    Sint32 sensor;      /**< The type of the sensor, one of the values of SDL_SensorType */
    float[3] data;      /**< Up to 3 values from the sensor, as defined in SDL_sensor.h */
    Uint64 sensor_timestamp; /**< The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock */
}

alias SDL_AudioDeviceID = uint;

struct SDL_AudioDeviceEvent {
    SDL_EventType type; /**< SDL_EVENT_AUDIO_DEVICE_ADDED, or SDL_EVENT_AUDIO_DEVICE_REMOVED, or SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_AudioDeviceID which;       /**< SDL_AudioDeviceID for the device being added or removed or changing */
    bool recording; /**< false if a playback device, true if a recording device. */
    Uint8 padding1;
    Uint8 padding2;
    Uint8 padding3;
}

alias SDL_CameraID = uint;

struct SDL_CameraDeviceEvent {
    SDL_EventType type; /**< SDL_EVENT_CAMERA_DEVICE_ADDED, SDL_EVENT_CAMERA_DEVICE_REMOVED, SDL_EVENT_CAMERA_DEVICE_APPROVED, SDL_EVENT_CAMERA_DEVICE_DENIED */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_CameraID which;       /**< SDL_CameraID for the device being added or removed or changing */
}

alias SDL_SensorID = uint;

struct SDL_SensorEvent {
    SDL_EventType type; /**< SDL_EVENT_SENSOR_UPDATE */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_SensorID which; /**< The instance ID of the sensor */
    float[6] data;      /**< Up to 6 values from the sensor - additional values can be queried using SDL_GetSensorData() */
    Uint64 sensor_timestamp; /**< The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock */
}

struct SDL_QuitEvent {
    SDL_EventType type; /**< SDL_EVENT_QUIT */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
}

struct SDL_UserEvent {
    Uint32 type;        /**< SDL_EVENT_USER through SDL_EVENT_LAST-1, Uint32 because these are not in the SDL_EventType enumeration */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The associated window if any */
    Sint32 code;        /**< User defined event code */
    void *data1;        /**< User defined data pointer */
    void *data2;        /**< User defined data pointer */
}

alias SDL_TouchID = ulong;

alias SDL_FingerID = ulong;

struct SDL_TouchFingerEvent {
    SDL_EventType type; /**< SDL_EVENT_FINGER_MOTION or SDL_EVENT_FINGER_DOWN or SDL_EVENT_FINGER_UP */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_TouchID touchID; /**< The touch device id */
    SDL_FingerID fingerID;
    float x;            /**< Normalized in the range 0...1 */
    float y;            /**< Normalized in the range 0...1 */
    float dx;           /**< Normalized in the range -1...1 */
    float dy;           /**< Normalized in the range -1...1 */
    float pressure;     /**< Normalized in the range 0...1 */
    SDL_WindowID windowID; /**< The window underneath the finger, if any */
}

alias SDL_PenID = uint;

struct SDL_PenProximityEvent {
    SDL_EventType type; /**< SDL_EVENT_PEN_PROXIMITY_IN or SDL_EVENT_PEN_PROXIMITY_OUT */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window with pen focus, if any */
    SDL_PenID which;        /**< The pen instance id */
}

alias SDL_PenInputFlags = uint;

enum : SDL_PenInputFlags
{
    SDL_PEN_INPUT_DOWN       = (1u << 0)  /**< pen is pressed down */,
    SDL_PEN_INPUT_BUTTON_1   = (1u << 1)  /**< button 1 is pressed */,
    SDL_PEN_INPUT_BUTTON_2   = (1u << 2)  /**< button 2 is pressed */,
    SDL_PEN_INPUT_BUTTON_3   = (1u << 3)  /**< button 3 is pressed */,
    SDL_PEN_INPUT_BUTTON_4   = (1u << 4)  /**< button 4 is pressed */,
    SDL_PEN_INPUT_BUTTON_5   = (1u << 5)  /**< button 5 is pressed */,
    SDL_PEN_INPUT_ERASER_TIP = (1u << 30) /**< eraser tip is used */,
}

struct SDL_PenTouchEvent {
    SDL_EventType type;     /**< SDL_EVENT_PEN_DOWN or SDL_EVENT_PEN_UP */
    Uint32 reserved;
    Uint64 timestamp;       /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID;  /**< The window with pen focus, if any */
    SDL_PenID which;        /**< The pen instance id */
    SDL_PenInputFlags pen_state;   /**< Complete pen input state at time of event */
    float x;                /**< X coordinate, relative to window */
    float y;                /**< Y coordinate, relative to window */
    bool eraser;        /**< true if eraser end is used (not all pens support this). */
    bool down;          /**< true if the pen is touching or false if the pen is lifted off */
}

struct SDL_PenMotionEvent {
    SDL_EventType type; /**< SDL_EVENT_PEN_MOTION */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window with pen focus, if any */
    SDL_PenID which;        /**< The pen instance id */
    SDL_PenInputFlags pen_state;   /**< Complete pen input state at time of event */
    float x;                /**< X coordinate, relative to window */
    float y;                /**< Y coordinate, relative to window */
}

struct SDL_PenButtonEvent {
    SDL_EventType type; /**< SDL_EVENT_PEN_BUTTON_DOWN or SDL_EVENT_PEN_BUTTON_UP */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window with mouse focus, if any */
    SDL_PenID which;        /**< The pen instance id */
    SDL_PenInputFlags pen_state;   /**< Complete pen input state at time of event */
    float x;                /**< X coordinate, relative to window */
    float y;                /**< Y coordinate, relative to window */
    Uint8 button;       /**< The pen button index (first button is 1). */
    bool down;      /**< true if the button is pressed */
}

alias SDL_PenAxis = int;

enum: SDL_PenAxis
{
    SDL_PEN_AXIS_PRESSURE,  /**< Pen pressure.  Unidirectional: 0 to 1.0 */
    SDL_PEN_AXIS_XTILT,     /**< Pen horizontal tilt angle.  Bidirectional: -90.0 to 90.0 (left-to-right). */
    SDL_PEN_AXIS_YTILT,     /**< Pen vertical tilt angle.  Bidirectional: -90.0 to 90.0 (top-to-down). */
    SDL_PEN_AXIS_DISTANCE,  /**< Pen distance to drawing surface.  Unidirectional: 0.0 to 1.0 */
    SDL_PEN_AXIS_ROTATION,  /**< Pen barrel rotation.  Bidirectional: -180 to 179.9 (clockwise, 0 is facing up, -180.0 is facing down). */
    SDL_PEN_AXIS_SLIDER,    /**< Pen finger wheel or slider (e.g., Airbrush Pen).  Unidirectional: 0 to 1.0 */
    SDL_PEN_AXIS_TANGENTIAL_PRESSURE,    /**< Pressure from squeezing the pen ("barrel pressure"). */
    SDL_PEN_AXIS_COUNT,       /**< Total known pen axis types in this version of SDL. This number may grow in future releases! */
}

struct SDL_PenAxisEvent {
    SDL_EventType type;     /**< SDL_EVENT_PEN_AXIS */
    Uint32 reserved;
    Uint64 timestamp;       /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID;  /**< The window with pen focus, if any */
    SDL_PenID which;        /**< The pen instance id */
    SDL_PenInputFlags pen_state;   /**< Complete pen input state at time of event */
    float x;                /**< X coordinate, relative to window */
    float y;                /**< Y coordinate, relative to window */
    SDL_PenAxis axis;       /**< Axis that has changed */
    float value;            /**< New value of axis */
}

struct SDL_RenderEvent {
    SDL_EventType type; /**< SDL_EVENT_RENDER_TARGETS_RESET, SDL_EVENT_RENDER_DEVICE_RESET, SDL_EVENT_RENDER_DEVICE_LOST */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID; /**< The window containing the renderer in question. */
}

struct SDL_DropEvent {
    SDL_EventType type; /**< SDL_EVENT_DROP_BEGIN or SDL_EVENT_DROP_FILE or SDL_EVENT_DROP_TEXT or SDL_EVENT_DROP_COMPLETE or SDL_EVENT_DROP_POSITION */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    SDL_WindowID windowID;    /**< The window that was dropped on, if any */
    float x;            /**< X coordinate, relative to window (not on begin) */
    float y;            /**< Y coordinate, relative to window (not on begin) */
    const char *source; /**< The source app that sent this drop event, or NULL if that isn't available */
    const char *data;   /**< The text for SDL_EVENT_DROP_TEXT and the file name for SDL_EVENT_DROP_FILE, NULL for other events */
}

struct SDL_ClipboardEvent {
    SDL_EventType type; /**< SDL_EVENT_CLIPBOARD_UPDATE */
    Uint32 reserved;
    Uint64 timestamp;   /**< In nanoseconds, populated using SDL_GetTicksNS() */
    bool owner;       /**< are we owning the clipboard (internal update) */
    Sint32 n_mime_types;     /**< number of mime types */
    const char **mime_types; /**< current mime types */
}

//------- SDL3 Logging ----------------------------

extern (C) void SDL_SetLogPriorities (SDL_LogPriority priority);

alias SDL_LogPriority = int;

enum : SDL_LogPriority
{
    SDL_LOG_PRIORITY_INVALID,
    SDL_LOG_PRIORITY_TRACE,
    SDL_LOG_PRIORITY_VERBOSE,
    SDL_LOG_PRIORITY_DEBUG,
    SDL_LOG_PRIORITY_INFO,
    SDL_LOG_PRIORITY_WARN,
    SDL_LOG_PRIORITY_ERROR,
    SDL_LOG_PRIORITY_CRITICAL,
    SDL_LOG_PRIORITY_COUNT,
}

extern (C) void SDL_SetLogOutputFunction (SDL_LogOutputFunction callback, void* userdata);

alias SDL_LogOutputFunction =
    extern (C) void function (void* userdata, int category, SDL_LogPriority priority, const(char*) message)
;

extern (C) void SDL_Log (const(char)* fmt, ...);
