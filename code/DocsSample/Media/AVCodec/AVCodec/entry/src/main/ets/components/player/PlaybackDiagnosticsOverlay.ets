/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { AvDiagnosticsPanel } from '../AvDiagnosticsPanel'
import { formatMediaTime } from '../../model/PlaybackInfoModel'
import { PlaybackRecoveryReason } from '../../model/PlaybackRecoveryModel'
import { PlaybackViewModel } from '../../viewmodel/PlaybackViewModel'

@Component
export struct PlaybackDiagnosticsOverlay {
  @ObjectLink model: PlaybackViewModel;
  @Prop diagnosticsVisible: boolean = false;
  textForResource: (resource: Resource) => string = (_resource: Resource): string => '';

  build() {
    if (this.diagnosticsVisible) {
      Column({ space: '6vp' }) {
        Text($r('app.string.playback_diagnostics')).fontSize('13fp').fontColor('#E8FFFFFF')
        Text(this.textForResource($r('app.string.playback_diagnostics_state')) + this.model.infoText)
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.textForResource($r('app.string.playback_diagnostics_position')) +
          formatMediaTime(this.model.positionUs) + ' / ' +
          formatMediaTime(this.model.durationUs) +
          this.textForResource($r('app.string.playback_diagnostics_speed')) +
          this.model.speed.toFixed(1))
          .fontSize('12fp').fontColor('#E8FFFFFF')
        if (this.model.hasVideo) {
          Text(this.textForResource($r('app.string.playback_diagnostics_output')) +
            this.model.videoOutputFrames +
            this.textForResource($r('app.string.playback_diagnostics_rendered')) +
            this.model.videoRenderedFrames +
            this.textForResource($r('app.string.playback_diagnostics_dropped')) +
            this.model.videoDroppedFrames)
            .fontSize('12fp').fontColor('#E8FFFFFF')
          Text(this.textForResource($r('app.string.playback_diagnostics_output_fps')) +
            this.model.videoOutputFps.toFixed(1) + ' fps' +
            this.textForResource($r('app.string.playback_diagnostics_drop_rate')) +
            this.model.videoDropRatePercent.toFixed(1) + '%')
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        if (this.model.hasAudio) {
          Text(this.textForResource($r('app.string.playback_diagnostics_audio_buffers')) +
            this.model.audioOutputBuffers)
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        if (this.model.hasVideo && this.model.isBufferMode) {
          Text(this.textForResource($r('app.string.playback_diagnostics_buffer_present')) +
            this.model.bufferPresentFrames +
            this.textForResource($r('app.string.playback_diagnostics_buffer_average')) +
            this.model.bufferPresentAverageUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_buffer_failures')) +
            this.model.bufferPresentFailures)
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        if (this.model.hasVideo && this.model.sinkDiagnosticsAvailable) {
          Text(this.textForResource($r('app.string.playback_diagnostics_vulkan_present')) +
            this.model.sinkFrames +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_frame')) +
            this.model.sinkFailures +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_failures')) +
            this.textForResource($r('app.string.playback_diagnostics_average')) +
            this.model.sinkAverageFrameUs.toFixed(1) + ' us')
            .fontSize('12fp').fontColor('#E8FFFFFF')
          Text(this.textForResource($r('app.string.playback_diagnostics_vulkan_wait')) +
            this.model.sinkAverageNativeImageWaitUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_acquire')) +
            this.model.sinkAverageNativeImageAcquireUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_fence')) +
            this.model.sinkAverageAcquireFenceWaitUs.toFixed(1) + ' us')
            .fontSize('12fp').fontColor('#E8FFFFFF')
          Text(this.textForResource($r('app.string.playback_diagnostics_vulkan_import')) +
            this.model.sinkAverageImportUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_gpu')) +
            this.model.sinkAverageGpuWaitUs.toFixed(1) + ' us')
            .fontSize('12fp').fontColor('#E8FFFFFF')
          Text(this.textForResource($r('app.string.playback_diagnostics_vulkan_record')) +
            this.model.sinkAverageCommandRecordUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_submit')) +
            this.model.sinkAverageSubmitUs.toFixed(1) + ' us' +
            this.textForResource($r('app.string.playback_diagnostics_vulkan_cache')) +
            this.model.sinkCacheHits + '/' + this.model.sinkCacheMisses)
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        if (this.model.hasVideo) {
          Text(this.textForResource($r('app.string.playback_diagnostics_smart_fluency')) +
            (this.model.isSmartFluencyAvailable ?
              this.textForResource($r('app.string.playback_diagnostics_available')) :
              this.textForResource($r('app.string.playback_diagnostics_unavailable'))) +
            this.textForResource($r('app.string.playback_diagnostics_hdr_vivid')) +
            (this.model.isHdrVividConfirmed ?
              this.textForResource($r('app.string.playback_diagnostics_confirmed')) :
              this.textForResource($r('app.string.playback_diagnostics_unconfirmed'))))
            .fontSize('12fp').fontColor('#E8FFFFFF')
          Text(this.textForResource($r('app.string.playback_diagnostics_software_fallback')) +
            (this.model.isSoftwareDecoderFallbackUsed ?
              this.textForResource($r('app.string.playback_diagnostics_used')) :
              this.textForResource($r('app.string.playback_diagnostics_not_used'))))
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        Text(this.textForResource($r('app.string.playback_diagnostics_recovery')) +
          (this.model.recoveryStatus === 0 ?
            this.textForResource($r('app.string.playback_diagnostics_recovery_idle')) :
            this.model.recoveryStatus === 1 ?
              this.textForResource($r('app.string.playback_diagnostics_recovery_pending')) :
              this.model.recoveryStatus === 2 ?
                this.textForResource($r('app.string.playback_diagnostics_recovery_succeeded')) :
                this.textForResource($r('app.string.playback_diagnostics_recovery_failed'))) +
          (this.model.recoveryAttemptCount > 0 ?
            this.textForResource($r('app.string.playback_diagnostics_recovery_attempt')) +
            this.model.recoveryAttemptCount +
            this.textForResource($r('app.string.playback_diagnostics_recovery_attempt_suffix')) : '') +
          (this.model.recoveryReason === PlaybackRecoveryReason.RUNTIME_ERROR ?
            this.textForResource($r('app.string.playback_diagnostics_recovery_reason')) : ''))
          .fontSize('12fp').fontColor('#E8FFFFFF')
        AvDiagnosticsPanel({ model: this.model })
      }
      .width('100%')
      .padding({ left: '12vp', right: '12vp', top: '10vp', bottom: '10vp' })
      .backgroundColor('#99101820')
      .borderRadius('12vp')
      .margin({ top: '48vp', left: '16vp' })
      .align(Alignment.TopStart)
      .hitTestBehavior(HitTestMode.None)
    }
  }
}
