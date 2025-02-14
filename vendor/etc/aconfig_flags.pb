
�
!com.android.graphics.libgui.flagsbq_consumer_attach_callbackcore_graphics"@Controls IProducerListener to have consumer side attach callback*	35320258208B5
/frameworks/native/libs/gui/libgui_flags.aconfigBt
nbuild/release/aconfig/ap3a/com.android.graphics.libgui.flags/bq_consumer_attach_callback_flag_values.textprotoB�
�vendor/google_shared/build/release/aconfig/next/com.android.graphics.libgui.flags/bq_consumer_attach_callback_flag_values.textprotoHP Zsystemb 
�
!com.android.graphics.libgui.flagsbq_extendedallocatecore_graphics"1Add BQ support for allocate with extended options*	26838249008B5
/frameworks/native/libs/gui/libgui_flags.aconfigHP Zsystemb 
�
!com.android.graphics.libgui.flagsbq_setframeratecore_graphics"9This flag controls plumbing setFrameRate thru BufferQueue*	28169572508B5
/frameworks/native/libs/gui/libgui_flags.aconfigBh
bbuild/release/aconfig/ap3a/com.android.graphics.libgui.flags/bq_setframerate_flag_values.textprotoB}
wvendor/google_shared/build/release/aconfig/next/com.android.graphics.libgui.flags/bq_setframerate_flag_values.textprotoHP Zsystemb 
�
!com.android.graphics.libgui.flagsframetimestamps_previousreleasecore_graphics")Controls a fence fixup for timestamp apis*	31092724708B5
/frameworks/native/libs/gui/libgui_flags.aconfigBx
rbuild/release/aconfig/ap3a/com.android.graphics.libgui.flags/frametimestamps_previousrelease_flag_values.textprotoB�
�vendor/google_shared/build/release/aconfig/next/com.android.graphics.libgui.flags/frametimestamps_previousrelease_flag_values.textprotoHP Zsystemb 
�
!com.android.graphics.libgui.flagstrace_frame_rate_overridecore_graphics"Trace FrameRateOverride fps*	34731403308B5
/frameworks/native/libs/gui/libgui_flags.aconfigB�
�vendor/google_shared/build/release/aconfig/next/com.android.graphics.libgui.flags/trace_frame_rate_override_flag_values.textprotoHP Zsystemb
�
com.android.media.audioserverdirect_track_reprioritizationmedia_audio"�Modify opening a direct output on a mixport to disrupt existing clients instead of failing to open when resource limit is reached*	29452589708B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigBr
lbuild/release/aconfig/ap3a/com.android.media.audioserver/direct_track_reprioritization_flag_values.textprotoB�
�vendor/google_shared/build/release/aconfig/next/com.android.media.audioserver/direct_track_reprioritization_flag_values.textprotoH P Zsystemb 
�
com.android.media.audioservereffect_chain_callback_improvemedia_audio"*Improve effect chain callback mutex logic.*	34241376708B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigH P Zsystemb 
�
com.android.media.audioserverfdtostring_timeout_fixmedia_audio"@Improve fdtostring implementation to properly handle timing out.*	30628301808B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigBk
ebuild/release/aconfig/ap3a/com.android.media.audioserver/fdtostring_timeout_fix_flag_values.textprotoB�
zvendor/google_shared/build/release/aconfig/next/com.android.media.audioserver/fdtostring_timeout_fix_flag_values.textprotoH P Zsystemb 
�
com.android.media.audioserver8fix_concurrent_playback_behavior_with_bit_perfect_clientmedia_audio"�Treat playback use cases differently when bit-perfect client is active to improve the user experience with bit-perfect playback.*	33951589908B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigH P Zsystemb 
�
com.android.media.audioserverfix_input_sharing_logicmedia_audio"dFix the audio policy logic that decides to reuse or close input streams when resources are exhausted*	33844641008B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigH P Zsystemb 
�
com.android.media.audioservermutex_priority_inheritancemedia_audio"�Enable mutex priority inheritance in audioserver (std::mutex does not normally transfer priority from the blocked thread to the blocking thread). This feature helps reduce audio glitching caused by low priority blocking threads.*	20949169508B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigBo
ibuild/release/aconfig/ap3a/com.android.media.audioserver/mutex_priority_inheritance_flag_values.textprotoB�
~vendor/google_shared/build/release/aconfig/next/com.android.media.audioserver/mutex_priority_inheritance_flag_values.textprotoH P Zsystemb 
�
com.android.media.audioserveruse_bt_sco_for_mediamedia_audio"2Play media strategy over Bluetooth SCO when active*	29203788608B;
5frameworks/av/media/audio/aconfig/audioserver.aconfigH P Zsystemb 
�
com.android.media.codec.flagsaidl_hal	codec_fwk",Feature flags for enabling AIDL HAL handling*	25185006908B:
4frameworks/av/media/aconfig/mediacodec_flags.aconfigB]
Wbuild/release/aconfig/ap3a/com.android.media.codec.flags/aidl_hal_flag_values.textprotoBr
lvendor/google_shared/build/release/aconfig/next/com.android.media.codec.flags/aidl_hal_flag_values.textprotoH P Zsystemb 
�
com.android.media.codec.flagscodec_importance	codec_fwk"(Feature flags for media codec importance*	29792901108B:
4frameworks/av/media/aconfig/mediacodec_flags.aconfigBe
_build/release/aconfig/ap3a/com.android.media.codec.flags/codec_importance_flag_values.textprotoBz
tvendor/google_shared/build/release/aconfig/next/com.android.media.codec.flags/codec_importance_flag_values.textprotoH PZsystemb 
�
com.android.media.codec.flagslarge_audio_frame	codec_fwk"+Feature flags for large audio frame support*	29721955708B:
4frameworks/av/media/aconfig/mediacodec_flags.aconfigBf
`build/release/aconfig/ap3a/com.android.media.codec.flags/large_audio_frame_flag_values.textprotoB{
uvendor/google_shared/build/release/aconfig/next/com.android.media.codec.flags/large_audio_frame_flag_values.textprotoH P Zsystemb 