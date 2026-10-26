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

import { RecorderDiagnostics, RecorderStreamStats, RecorderStageTiming } from 'librecorder.so';
import { LocalizedText } from '../common/LocalizedText';
import { DumpFilesModel } from './DumpFilesModel';

export class RecorderLiveDiagnosticsModel {
  private static text(resource: Resource): string { return LocalizedText.get(resource); }

  private static metric(resource: Resource, measurement: number, unit: string, decimals: number = 1): string {
    return RecorderLiveDiagnosticsModel.text(resource) + ': ' + (measurement < 0 ?
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_unknown')) : measurement.toFixed(decimals) + unit);
  }

  static warnings(stats: RecorderStreamStats, active: boolean): string {
    const lines: string[] = [];
    if (active && stats.outputIdleMs > 1000) {
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_stalled')));
    } else if (active && stats.frames > stats.expectedFps * 2 && stats.expectedFps > 0 &&
      stats.recentFps < stats.expectedFps * 0.8) {
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_low_fps')));
    }
    if (active && stats.freeBytes >= 0 && stats.freeBytes < 256 * 1048576) {
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_space_low')));
    }
    return lines.join(String.fromCharCode(10));
  }

  static compact(stats: RecorderStreamStats, name: string, active: boolean): string {
    const warning: string = RecorderLiveDiagnosticsModel.warnings(stats, active);
    return name + ' · ' + RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_recent')) + ' ' +
      stats.recentFps.toFixed(1) + ' fps / ' + (stats.recentBitrate / 1000000).toFixed(2) + ' Mbit/s · ' +
      (stats.fileBytes < 0 ? '--' : (stats.fileBytes / 1048576).toFixed(1) + ' MiB') +
      (warning.length > 0 ? String.fromCharCode(10) + warning : '');
  }

  private static timing(resource: Resource, timing: RecorderStageTiming): string {
    return RecorderLiveDiagnosticsModel.text(resource) + ': ' + (timing.count === 0 ?
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_unknown')) :
      timing.averageMs.toFixed(2) + ' / ' + timing.p95Ms.toFixed(2) + ' / ' + timing.maximumMs.toFixed(2) +
      ' ms (n=' + timing.count + ')');
  }

  private static keyFrameStatus(stats: RecorderStreamStats): string {
    let status: Resource = $r('app.string.rec_diag_key_none');
    if (stats.keyFrameRequest === 'pending') { status = $r('app.string.rec_diag_key_pending'); }
    if (stats.keyFrameRequest === 'observed') { status = $r('app.string.rec_diag_key_observed'); }
    if (stats.keyFrameRequest === 'ended') { status = $r('app.string.rec_diag_key_ended'); }
    return RecorderLiveDiagnosticsModel.text(status) +
      (stats.keyFrameWaitMs >= 0 ? ' · ' + stats.keyFrameWaitMs.toFixed(0) + ' ms' : '');
  }

  static details(stats: RecorderStreamStats, name: string): string {
    const lines: string[] = [name,
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_target'),
        stats.targetBitrate > 0 ? stats.targetBitrate / 1000000 : -1, ' Mbit/s', 2),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_recent')) + ': ' + stats.recentFps.toFixed(1) +
        ' fps / ' + (stats.recentBitrate / 1000000).toFixed(2) + ' Mbit/s',
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_bitrate_delta')) + ': ' +
        (stats.targetBitrate > 0 && stats.recentFps > 0 ?
          ((stats.recentBitrate / stats.targetBitrate - 1) * 100).toFixed(1) + '%' :
          RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_unknown'))),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_average')) + ': ' + stats.framesPerSecond.toFixed(1) +
        ' fps / ' + (stats.bitrate / 1000000).toFixed(2) + ' Mbit/s',
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_expected'), stats.expectedFps, ' fps'),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_idle'), stats.outputIdleMs, ' ms'),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_gap'), stats.longestGapMs, ' ms'),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_pts'), stats.ptsRegressions, '', 0),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_recent_note')),
      '',
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_keyframes'), stats.keyFrames, '', 0),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_key_pts'), stats.lastKeyFramePtsUs, ' us', 0),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_key_interval'), stats.keyFrameIntervalMs, ' ms'),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_key_requests'), stats.keyFrameRequests, '', 0),
      RecorderLiveDiagnosticsModel.keyFrameStatus(stats),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_parameters')) + ': ' +
        stats.parameterAccepted + ' / ' + stats.parameterRejected,
      '',
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_queue')) + ': ' + stats.queueDepth + ' / ' + stats.queuePeak,
      RecorderLiveDiagnosticsModel.timing($r('app.string.rec_diag_wait'), stats.queueWait),
      RecorderLiveDiagnosticsModel.timing($r('app.string.rec_diag_residence'), stats.queueResidence),
      RecorderLiveDiagnosticsModel.timing($r('app.string.rec_diag_muxer'), stats.muxerWrite),
      RecorderLiveDiagnosticsModel.timing($r('app.string.rec_diag_dump_write'), stats.dumpWrite),
      RecorderLiveDiagnosticsModel.timing($r('app.string.rec_diag_hold'), stats.bufferHold),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_timing_note')),
      '',
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_file'), stats.fileBytes / 1048576, ' MiB', 2),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_growth'), stats.fileBytesPerSecond / 1048576, ' MiB/s', 2),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_free'), stats.freeBytes / 1048576, ' MiB', 1),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_dump')) + ': ' +
        (stats.dumpState === 'disabled' ? RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_disabled')) :
          DumpFilesModel.stateLabel(stats.dumpState)) + ' / ' + (stats.dumpBytes / 1048576).toFixed(2) + ' MiB',
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_storage_note')),
      '',
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_requested')) + ': ' + stats.requestedConfiguration,
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_codec')) + ': ' + stats.codecDescription,
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_codec_size')) + ': ' +
        (stats.codecWidth > 0 && stats.codecHeight > 0 ? stats.codecWidth + ' x ' + stats.codecHeight :
          RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_unknown'))),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_codec_fps'),
        stats.codecFps > 0 ? stats.codecFps : -1, ' fps'),
      RecorderLiveDiagnosticsModel.metric($r('app.string.rec_diag_codec_bitrate'),
        stats.codecBitrate > 0 ? stats.codecBitrate / 1000000 : -1, ' Mbit/s', 2),
      RecorderLiveDiagnosticsModel.text($r('app.string.rec_diag_verified'))];
    return lines.join(String.fromCharCode(10));
  }

  static report(diagnostics: RecorderDiagnostics, secondary: boolean): string {
    const lines: string[] = [RecorderLiveDiagnosticsModel.details(diagnostics.primary,
      RecorderLiveDiagnosticsModel.text($r('app.string.recorder_primary')))];
    if (secondary || diagnostics.secondary.frames > 0) {
      lines.push(RecorderLiveDiagnosticsModel.details(diagnostics.secondary,
        RecorderLiveDiagnosticsModel.text($r('app.string.recorder_secondary'))));
    }
    if (diagnostics.failure.stage.length > 0) {
      lines.push(diagnostics.failure.stage + ' · ' + diagnostics.failure.code + ' · ' + diagnostics.failure.message);
    }
    if (diagnostics.audio !== undefined) {
      const audio = diagnostics.audio;
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_title')) + '\n' +
        RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_pcm')) + ': ' + audio.capturedFrames +
        ' / ' + audio.pendingPcmMs.toFixed(1) + ' ms\n' +
        RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_output')) + ': ' + audio.outputFrames + '\n' +
        RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_rate')) + ': ' +
        (audio.recentBitrate / 1000).toFixed(1) + ' kbit/s\n' +
        RecorderLiveDiagnosticsModel.metric($r('app.string.rec_audio_idle'), audio.outputIdleMs, ' ms') + '\n' +
        RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_pts')) + ': ' +
        RecorderLiveDiagnosticsModel.ptsDifference(audio.firstPtsUs, audio.primaryFirstPtsUs) + ' / ' +
        RecorderLiveDiagnosticsModel.ptsDifference(audio.lastPtsUs, audio.primaryLastPtsUs) + ' ms');
      if (secondary) {
        lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_secondary_pts')) + ': ' +
          RecorderLiveDiagnosticsModel.ptsDifference(audio.firstPtsUs, audio.secondaryFirstPtsUs) + ' / ' +
          RecorderLiveDiagnosticsModel.ptsDifference(audio.lastPtsUs, audio.secondaryLastPtsUs) + ' ms');
      }
      lines.push(RecorderLiveDiagnosticsModel.timing($r('app.string.rec_audio_muxer_primary'), audio.primaryMuxer));
      lines.push(RecorderLiveDiagnosticsModel.timing($r('app.string.rec_audio_muxer_secondary'), audio.secondaryMuxer));
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_write_failures')) + ': ' +
        audio.primaryWriteFailures + ' / ' + audio.secondaryWriteFailures);
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_audio_note')));
    }
    if (diagnostics.timeline !== undefined) {
      lines.push(RecorderLiveDiagnosticsModel.text($r('app.string.rec_timeline_title')) + ' · ' +
        RecorderLiveDiagnosticsModel.endReason(diagnostics.endReason));
      for (const event of diagnostics.timeline) {
        lines.push('+' + event.elapsedMs + ' ms · ' + RecorderLiveDiagnosticsModel.stage(event.stage) +
          ' [' + event.stage + '] · ' + event.result);
      }
    }
    return lines.join(String.fromCharCode(10, 10));
  }

  private static ptsDifference(audio: number, video: number): string {
    return audio >= 0 && video >= 0 ? ((audio - video) / 1000).toFixed(1) : '--';
  }

  static endReason(reason: string): string {
    if (reason === 'user_stop') { return LocalizedText.get($r('app.string.rec_end_user')); }
    if (reason === 'low_space') { return LocalizedText.get($r('app.string.rec_end_space')); }
    return reason || LocalizedText.get($r('app.string.rec_end_running'));
  }

  private static stage(stage: string): string {
    switch (stage) {
      case 'initialize.begin': return LocalizedText.get($r('app.string.rec_stage_init_begin'));
      case 'initialize.end': return LocalizedText.get($r('app.string.rec_stage_init_end'));
      case 'encoder.started': return LocalizedText.get($r('app.string.rec_stage_encoder'));
      case 'camera.started': return LocalizedText.get($r('app.string.rec_stage_camera'));
      case 'primary.first_output': return LocalizedText.get($r('app.string.rec_stage_first_primary'));
      case 'secondary.first_output': return LocalizedText.get($r('app.string.rec_stage_first_secondary'));
      case 'audio.first_output': return LocalizedText.get($r('app.string.rec_stage_first_audio'));
      case 'stop.requested': return LocalizedText.get($r('app.string.rec_stage_stop'));
      case 'primary.eos': return LocalizedText.get($r('app.string.rec_stage_eos_primary'));
      case 'secondary.eos': return LocalizedText.get($r('app.string.rec_stage_eos_secondary'));
      case 'audio.eos': return LocalizedText.get($r('app.string.rec_stage_eos_audio'));
      case 'primary.muxer_released': return LocalizedText.get($r('app.string.rec_stage_muxer_primary'));
      case 'secondary.muxer_released': return LocalizedText.get($r('app.string.rec_stage_muxer_secondary'));
      case 'native.released': return LocalizedText.get($r('app.string.rec_stage_native'));
      case 'files.closed': return LocalizedText.get($r('app.string.rec_stage_files'));
      case 'camera.released': return LocalizedText.get($r('app.string.rec_stage_camera_release'));
      default: return stage;
    }
  }
}
