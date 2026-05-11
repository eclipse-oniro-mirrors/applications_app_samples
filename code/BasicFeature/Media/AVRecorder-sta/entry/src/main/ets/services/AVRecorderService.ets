'use static'

// [Start full_audio_recorder]
// [Start full_video_recorder]
// [Start create_recorder]
// [Start set_callback]
// [Start prepare_audio_recorder]
// [Start prepare_video_recorder]
// [Start get_input_surface]
import { BusinessError } from '@ohos.base';
// [End set_callback]
// [End get_input_surface]
import media from '@ohos.multimedia.media';
// [End create_recorder]
import fileIo from '@ohos.file.fs';
// [End prepare_audio_recorder]
// [End prepare_video_recorder]
import common from '@ohos.app.ability.common';
// [End full_audio_recorder]
// [End full_video_recorder]
import { Resolution } from './CommonTypes';

// [Start full_audio_recorder]
// [Start full_video_recorder]
export default class AVRecorderService {
// [Start create_recorder]
  private avRecorder: media.AVRecorder | undefined = undefined;
// [End create_recorder]
// [Start prepare_audio_recorder]
// [Start prepare_video_recorder]
  private avRecorderConfig: media.AVRecorderConfig =
    { profile: { fileFormat: media.ContainerFormatType.CFT_MPEG_4A }, url: '' };
  private fileFd: int | undefined = undefined;
// [End prepare_audio_recorder]
// [End prepare_video_recorder]

  public async createRecorder(): Promise<void> {
    await this.releaseRecorder();
// [Start create_recorder]
    try {
      this.avRecorder = await media.createAVRecorder();
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      console.error(`Failed to create avRecorder, error code: ${error.code}, message: ${error.message}`);
    }
// [End create_recorder]
  }

  public setCallback(onStateChanged: media.OnAVRecorderStateChangeHandler): void {
    if (this.avRecorder) {
      console.info('setCallback');
    }
// [Start set_callback]
    this.avRecorder?.onStateChange((state, reason) => {
      console.info(`AVRecorder state is changed to ${state}, reason: ${reason}`);
      // 用户可以在此补充状态发生切换后想要进行的动作。
      onStateChanged(state, reason);
    });
    this.avRecorder?.onError((error) => {
      console.error(`Error occurred in avRecorder, error code: ${error.code}, message: ${error.message}`);
    });
// [End set_callback]
  }
// [End full_video_recorder]

// [Start prepare_audio_recorder]
  public configAudioDefault(): void {
    this.avRecorderConfig.profile.audioBitrate = 112000; // 音频比特率。
    this.avRecorderConfig.profile.audioChannels = 2; // 音频声道数。
    this.avRecorderConfig.profile.audioCodec = media.CodecMimeType.AUDIO_AAC; // 音频编码格式。
    this.avRecorderConfig.profile.audioSampleRate = 48000; // 音频采样率。
    this.avRecorderConfig.audioSourceType = media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC; // 音频输入源，这里设置为麦克风。
  }
// [End prepare_audio_recorder]
// [End full_audio_recorder]

  public configAudioSampleRate(sampleRate: int): void {
    this.avRecorderConfig.profile.audioSampleRate = sampleRate; // 音频采样率。
  }

// [Start full_video_recorder]
// [Start prepare_video_recorder]
  public configVideoDefault(): void {
    this.avRecorderConfig.profile.videoBitrate = 3000000; // 视频比特率。
    this.avRecorderConfig.profile.videoCodec = media.CodecMimeType.VIDEO_AVC; // 视频文件编码格式。
    this.avRecorderConfig.profile.videoFrameWidth = 640; // 视频分辨率的宽。
    this.avRecorderConfig.profile.videoFrameHeight = 480; // 视频分辨率的高。
    this.avRecorderConfig.profile.videoFrameRate = 30; // 视频帧率。
    this.avRecorderConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV; // 视频源类型。
    this.avRecorderConfig.metadata = {
      videoOrientation: '90' // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270。
    };
  }
// [End prepare_video_recorder]
// [End full_video_recorder]

  public configVideoSourceType(videoSourceType: media.VideoSourceType): void {
    this.avRecorderConfig.videoSourceType = videoSourceType;
  }

  public configVideoResolution(videoResolution: Resolution): void {
    this.avRecorderConfig.profile.videoFrameHeight = videoResolution.frameHeight;
    this.avRecorderConfig.profile.videoFrameWidth = videoResolution.frameWidth;
  }

// [Start full_audio_recorder]
// [Start full_video_recorder]
// [Start prepare_audio_recorder]
// [Start prepare_video_recorder]
  public configOutputFile(fd: int, format: media.ContainerFormatType): void {
    this.fileFd = fd;
    this.avRecorderConfig.url = 'fd://' + fd.toString();
    this.avRecorderConfig.profile.fileFormat = format;
  }

  public async prepareRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'idle' || this.avRecorder?.state === 'stopped') {
        await this.avRecorder?.prepare(this.avRecorderConfig);
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to prepare avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }
// [End prepare_audio_recorder]
// [End prepare_video_recorder]
// [End full_audio_recorder]

  async getInputSurface(): Promise<string | undefined> {
// [Start get_input_surface]
    let surfaceId: string | undefined = undefined;
    try {
      surfaceId = await this.avRecorder?.getInputSurface();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to get input surface, error code: ${err.code}, message: ${err.message}`);
    }
// [End get_input_surface]
    return surfaceId;
  }

// [Start full_audio_recorder]
  public async startRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'prepared') {
// [Start start_recorder]
        await this.avRecorder?.start();
// [End start_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to start avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async pauseRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'started') {
// [Start pause_recorder]
        await this.avRecorder?.pause();
// [End pause_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to pause avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async resumeRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'paused') {
// [Start resume_recorder]
        await this.avRecorder?.resume();
// [End resume_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to resume avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async stopRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'started' || this.avRecorder?.state === 'paused') {
// [Start stop_recorder]
        await this.avRecorder?.stop();
// [End stop_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to stop avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async resetRecorder(): Promise<void> {
    try {
// [Start reset_recorder]
      await this.avRecorder?.reset();
// [End reset_recorder]
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to reset avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async releaseRecorder(): Promise<void> {
    try {
      this.avRecorder?.offStateChange();
      this.avRecorder?.offError();
// [Start release_recorder]
      await this.avRecorder?.release();
// [End release_recorder]
      this.avRecorder = undefined;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to release avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async closeFd(): Promise<void> {
    try {
      if (this.fileFd) {
        await fileIo.close(this.fileFd!);
        this.fileFd = undefined;
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to close fd, error code: ${err.code}, message: ${err.message}`);
    }
  }
}
// [End full_audio_recorder]
// [End full_video_recorder]