package ctru

// ============================================================
// Y2R — hardware YUV to RGB conversion
// 3ds/services/y2r.h
//
// Converts camera or video frames from YUV to RGB on the dedicated hardware, without using the
// CPU.
// ============================================================

// Input color formats For the 16-bit per component formats, bits 15-8 are padding and 7-0 contains
// the value.
Y2RU_InputFormat :: enum u8 {
    YUV422_INDIV_8  = 0, // 8-bit per component, planar YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples).\n Usually named YUV422P.
    YUV420_INDIV_8  = 1, // 8-bit per component, planar YUV 4:2:0, 12bpp, (1 Cr & Cb sample per 2x2 Y samples).\n Usually named YUV420P.
    YUV422_INDIV_16 = 2, // 16-bit per component, planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples).\n Usually named YUV422P16.
    YUV420_INDIV_16 = 3, // 16-bit per component, planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples).\n Usually named YUV420P16.
    YUV422_BATCH    = 4, // 8-bit per component, packed YUV 4:2:2, 16bpp, (Y0 Cb Y1 Cr).\n Usually named YUYV422.
}

// Output color formats Those are the same as the framebuffer and GPU texture formats.
Y2RU_OutputFormat :: enum u8 {
    RGB_32     = 0, // 32-bit RGBA8888. The alpha component is the 8-bit value set by Y2RU_SetAlpha
    RGB_24     = 1, // 24-bit RGB888.
    RGB_16_555 = 2, // 16-bit RGBA5551. The alpha bit is the 7th bit of the alpha value set by Y2RU_SetAlpha
    RGB_16_565 = 3, // 16-bit RGB565.
}

// Rotation to be applied to the output.
Y2RU_Rotation :: enum u8 {
    NONE          = 0, // No rotation.
    CLOCKWISE_90  = 1, // Clockwise 90 degrees.
    CLOCKWISE_180 = 2, // Clockwise 180 degrees.
    CLOCKWISE_270 = 3, // Clockwise 270 degrees.
}

// Block alignment of output Defines the way the output will be laid out in memory.
Y2RU_BlockAlignment :: enum u8 {
    BLOCK_LINE   = 0, // The result buffer will be laid out in linear format, the usual way.
    BLOCK_8_BY_8 = 1, // The result will be stored as 8x8 blocks in Z-order.\n Useful for textures since it is the format used by the PICA200.
}

// Coefficients of the YUV->RGB conversion formula. A set of coefficients configuring the RGB to YUV
// conversion. Coefficients 0-4 are unsigned 2.8 fixed pointer numbers representing entries on the
// conversion matrix, while coefficient 5-7 are signed 11.5 fixed point numbers added as offsets to
// the RGB result. The overall conversion process formula is:
Y2RU_ColorCoefficients :: struct {
    rgb_Y:    u16, // RGB per unit Y.
    r_V:      u16, // Red per unit V.
    g_V:      u16, // Green per unit V.
    g_U:      u16, // Green per unit U.
    b_U:      u16, // Blue per unit U.
    r_offset: u16, // Red offset.
    g_offset: u16, // Green offset.
    b_offset: u16, // Blue offset.
}

// Structure used to configure all parameters at once. You can send a batch of configuration
// parameters using this structure and
// Opaque here: the C type has a union or bitfields. 12 bytes.
Y2RU_ConversionParams :: struct #align(2) {
    _: [12]u8,
}

// Dithering weights.
Y2RU_DitheringWeightParams :: struct {
    w0_xEven_yEven: u16, // Weight 0 for even X, even Y.
    w0_xOdd_yEven:  u16, // Weight 0 for odd X, even Y.
    w0_xEven_yOdd:  u16, // Weight 0 for even X, odd Y.
    w0_xOdd_yOdd:   u16, // Weight 0 for odd X, odd Y.
    w1_xEven_yEven: u16, // Weight 1 for even X, even Y.
    w1_xOdd_yEven:  u16, // Weight 1 for odd X, even Y.
    w1_xEven_yOdd:  u16, // Weight 1 for even X, odd Y.
    w1_xOdd_yOdd:   u16, // Weight 1 for odd X, odd Y.
    w2_xEven_yEven: u16, // Weight 2 for even X, even Y.
    w2_xOdd_yEven:  u16, // Weight 2 for odd X, even Y.
    w2_xEven_yOdd:  u16, // Weight 2 for even X, odd Y.
    w2_xOdd_yOdd:   u16, // Weight 2 for odd X, odd Y.
    w3_xEven_yEven: u16, // Weight 3 for even X, even Y.
    w3_xOdd_yEven:  u16, // Weight 3 for odd X, even Y.
    w3_xEven_yOdd:  u16, // Weight 3 for even X, odd Y.
    w3_xOdd_yOdd:   u16, // Weight 3 for odd X, odd Y.
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes the y2r service. This will internally get the handle of the service, and on
    // success call Y2RU_DriverInitialize.
    y2rInit :: proc() -> Result ---

    // Closes the y2r service. This will internally call Y2RU_DriverFinalize and close the handle of
    // the service.
    y2rExit :: proc() ---

    // Used to configure the input format.
    Y2RU_SetInputFormat :: proc(format: Y2RU_InputFormat) -> Result ---

    // Gets the configured input format.
    Y2RU_GetInputFormat :: proc(format: ^Y2RU_InputFormat) -> Result ---

    // Used to configure the output format.
    Y2RU_SetOutputFormat :: proc(format: Y2RU_OutputFormat) -> Result ---

    // Gets the configured output format.
    Y2RU_GetOutputFormat :: proc(format: ^Y2RU_OutputFormat) -> Result ---

    // Used to configure the rotation of the output.
    Y2RU_SetRotation :: proc(rotation: Y2RU_Rotation) -> Result ---

    // Gets the configured rotation.
    Y2RU_GetRotation :: proc(rotation: ^Y2RU_Rotation) -> Result ---

    // Used to configure the alignment of the output buffer.
    Y2RU_SetBlockAlignment :: proc(alignment: Y2RU_BlockAlignment) -> Result ---

    // Gets the configured alignment.
    Y2RU_GetBlockAlignment :: proc(alignment: ^Y2RU_BlockAlignment) -> Result ---

    // Sets whether to use spacial dithering.
    Y2RU_SetSpacialDithering :: proc(enable: bool) -> Result ---

    // Gets whether to use spacial dithering.
    Y2RU_GetSpacialDithering :: proc(enabled: ^bool) -> Result ---

    // Sets whether to use temporal dithering.
    Y2RU_SetTemporalDithering :: proc(enable: bool) -> Result ---

    // Gets whether to use temporal dithering.
    Y2RU_GetTemporalDithering :: proc(enabled: ^bool) -> Result ---

    // Used to configure the width of the image.
    Y2RU_SetInputLineWidth :: proc(line_width: u16) -> Result ---

    // Gets the configured input line width.
    Y2RU_GetInputLineWidth :: proc(line_width: ^u16) -> Result ---

    // Used to configure the height of the image.
    Y2RU_SetInputLines :: proc(num_lines: u16) -> Result ---

    // Gets the configured number of input lines.
    Y2RU_GetInputLines :: proc(num_lines: ^u16) -> Result ---

    // Used to configure the color conversion formula.
    Y2RU_SetCoefficients :: proc(coefficients: ^Y2RU_ColorCoefficients) -> Result ---

    // Gets the configured color coefficients.
    Y2RU_GetCoefficients :: proc(coefficients: ^Y2RU_ColorCoefficients) -> Result ---

    // Used to configure the color conversion formula with ITU stantards coefficients.
    Y2RU_SetStandardCoefficient :: proc(coefficient: Y2RU_StandardCoefficient) -> Result ---

    // Gets the color coefficient parameters of a standard coefficient.
    Y2RU_GetStandardCoefficient :: proc(coefficients: ^Y2RU_ColorCoefficients, standardCoeff: Y2RU_StandardCoefficient) -> Result ---

    // Used to configure the alpha value of the output.
    Y2RU_SetAlpha :: proc(alpha: u16) -> Result ---

    // Gets the configured output alpha value.
    Y2RU_GetAlpha :: proc(alpha: ^u16) -> Result ---

    // Used to enable the end of conversion interrupt.
    Y2RU_SetTransferEndInterrupt :: proc(should_interrupt: bool) -> Result ---

    // Gets whether the transfer end interrupt is enabled.
    Y2RU_GetTransferEndInterrupt :: proc(should_interrupt: ^bool) -> Result ---

    // Gets an handle to the end of conversion event.
    Y2RU_GetTransferEndEvent :: proc(end_event: ^Handle) -> Result ---

    // Configures the Y plane buffer.
    Y2RU_SetSendingY :: proc(src_buf: rawptr, image_size: u32, transfer_unit: i16, transfer_gap: i16) -> Result ---

    // Configures the U plane buffer.
    Y2RU_SetSendingU :: proc(src_buf: rawptr, image_size: u32, transfer_unit: i16, transfer_gap: i16) -> Result ---

    // Configures the V plane buffer.
    Y2RU_SetSendingV :: proc(src_buf: rawptr, image_size: u32, transfer_unit: i16, transfer_gap: i16) -> Result ---

    // Configures the YUYV source buffer.
    Y2RU_SetSendingYUYV :: proc(src_buf: rawptr, image_size: u32, transfer_unit: i16, transfer_gap: i16) -> Result ---

    // Configures the destination buffer.
    Y2RU_SetReceiving :: proc(dst_buf: rawptr, image_size: u32, transfer_unit: i16, transfer_gap: i16) -> Result ---

    // Checks if the DMA has finished sending the Y buffer.
    Y2RU_IsDoneSendingY :: proc(is_done: ^bool) -> Result ---

    // Checks if the DMA has finished sending the U buffer.
    Y2RU_IsDoneSendingU :: proc(is_done: ^bool) -> Result ---

    // Checks if the DMA has finished sending the V buffer.
    Y2RU_IsDoneSendingV :: proc(is_done: ^bool) -> Result ---

    // Checks if the DMA has finished sending the YUYV buffer.
    Y2RU_IsDoneSendingYUYV :: proc(is_done: ^bool) -> Result ---

    // Checks if the DMA has finished sending the converted result.
    Y2RU_IsDoneReceiving :: proc(is_done: ^bool) -> Result ---

    // Configures the dithering weight parameters.
    Y2RU_SetDitheringWeightParams :: proc(params: ^Y2RU_DitheringWeightParams) -> Result ---

    // Gets the configured dithering weight parameters.
    Y2RU_GetDitheringWeightParams :: proc(params: ^Y2RU_DitheringWeightParams) -> Result ---

    // Sets all of the parameters of Y2RU_ConversionParams at once.
    Y2RU_SetConversionParams :: proc(params: ^Y2RU_ConversionParams) -> Result ---

    // Starts the conversion process
    Y2RU_StartConversion :: proc() -> Result ---

    // Cancels the conversion
    Y2RU_StopConversion :: proc() -> Result ---

    // Checks if the conversion and DMA transfer are finished.
    Y2RU_IsBusyConversion :: proc(is_busy: ^bool) -> Result ---

    // Checks whether Y2R is ready to be used.
    Y2RU_PingProcess :: proc(ping: ^u8) -> Result ---

    // Initializes the Y2R driver.
    Y2RU_DriverInitialize :: proc() -> Result ---

    // Terminates the Y2R driver.
    Y2RU_DriverFinalize :: proc() -> Result ---
}
