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

import { deviceInfo } from '@kit.BasicServicesKit';
import { PlaybackInfo, PlaybackTimelineEvent } from 'libplayer.so';
import { TranscodeStatus, TranscodeMeasurement } from 'libtranscoder.so';
import { MediaTaskKind } from './MediaTaskCoordinator';

export type MediaErrorCategory = 'none' | 'cancelled' | 'capability' | 'configuration' | 'permission' |
  'storage' | 'input' | 'codec' | 'graphics' | 'mux' | 'unknown';
export interface MediaSessionError { category: MediaErrorCategory; stage: string; code: number; detail: string; }
export interface MediaSessionMetric { name: string; amount: number; unit: string; }
export interface MediaSessionEvent { elapsedMs: number; stage: string; }
export interface MediaSessionReport {
  version: number; id: string; operation: MediaTaskKind; createdAt: number; device: string; api: number;
  nativeSessionId?: string;
  outcome: string; requested: string; observed: string; error: MediaSessionError;
  metrics: MediaSessionMetric[]; events: MediaSessionEvent[];
}

export class MediaReports {
  static shareable(report: MediaSessionReport): MediaSessionReport {
    const shared: MediaSessionReport = JSON.parse(JSON.stringify(report)) as MediaSessionReport;
    shared.requested = MediaReports.redact(shared.requested);
    shared.observed = MediaReports.redact(shared.observed);
    shared.error.detail = MediaReports.redact(shared.error.detail);
    shared.error.stage = MediaReports.redact(shared.error.stage);
    shared.events = shared.events.map((event: MediaSessionEvent): MediaSessionEvent =>
      ({ elapsedMs: event.elapsedMs, stage: MediaReports.redact(event.stage) }));
    return shared;
  }
  private static redact(detail: string): string {
    return detail.replace(/(?:file|content|datashare|https?):[^\s]+/gi, '[uri]')
      .replace(/(?:[A-Za-z]:[\\/]|\/)[^\s]+/g, '[path]');
  }

  static parseList(text: string): MediaSessionReport[] {
    const reports: MediaSessionReport[] = JSON.parse(text) as MediaSessionReport[];
    if (!Array.isArray(reports)) { throw new Error('Invalid session report list'); }
    return reports.filter((report: MediaSessionReport): boolean =>
      MediaReports.valid(report) && report.operation !== 'recording').slice(0, 30);
  }

  private static valid(report: MediaSessionReport): boolean {
    if (report === null || typeof report !== 'object' || report.version !== 1 ||
      !MediaReports.shortText(report.id, 160) ||
      !['playback', 'recording', 'transcode', 'cleanup'].includes(report.operation) ||
      (report.nativeSessionId !== undefined && !MediaReports.shortText(report.nativeSessionId, 160)) ||
      !Number.isFinite(report.createdAt) || report.createdAt <= 0 || !Number.isInteger(report.api) ||
      !MediaReports.shortText(report.device, 1024) || !MediaReports.shortText(report.outcome, 64) ||
      !MediaReports.shortText(report.requested, 16384) || !MediaReports.shortText(report.observed, 16384) ||
      report.error === null || typeof report.error !== 'object' ||
      !MediaReports.shortText(report.error.category, 64) || !MediaReports.shortText(report.error.stage, 1024) ||
      !MediaReports.shortText(report.error.detail, 16384) || !Number.isFinite(report.error.code) ||
      !Array.isArray(report.metrics) || report.metrics.length > 128 ||
      !Array.isArray(report.events) || report.events.length > 256) { return false; }
    return report.metrics.every((metric: MediaSessionMetric): boolean => metric !== null &&
      typeof metric === 'object' && MediaReports.shortText(metric.name, 256) &&
      MediaReports.shortText(metric.unit, 32) && Number.isFinite(metric.amount)) &&
      report.events.every((event: MediaSessionEvent): boolean => event !== null && typeof event === 'object' &&
        Number.isFinite(event.elapsedMs) && event.elapsedMs >= 0 && MediaReports.shortText(event.stage, 1024));
  }

  private static shortText(value: string, limit: number): boolean {
    return typeof value === 'string' && value.length <= limit;
  }
  static error(stage: string, code: number, detail: string, cancelled: boolean = false): MediaSessionError {
    const hint: string = (stage + ' ' + detail).toLowerCase();
    let category: MediaErrorCategory = stage.length === 0 && code === 0 ? 'none' : 'unknown';
    if (cancelled) {
      category = 'cancelled';
    } else if (/permission|denied|13900012/.test(hint)) {
      category = 'permission';
    } else if (/storage|space|flush|files|disk/.test(hint)) {
      category = 'storage';
    } else if (/capability|unsupported|not support/.test(hint)) {
      category = 'capability';
    } else if (/configure|parameter|invalid/.test(hint)) {
      category = 'configuration';
    } else if (/Surface|Vulkan|OpenGL|NativeImage|render|present/i.test(hint)) {
      category = 'graphics';
    } else if (/mux|write sample/.test(hint)) {
      category = 'mux';
    } else if (/source|demux|read sample/.test(hint)) {
      category = 'input';
    } else if (/codec|decoder|encoder/.test(hint)) {
      category = 'codec';
    }
    return { category: category, stage: stage, code: code, detail: detail };
  }

  static base(id: string, operation: MediaTaskKind, outcome: string): MediaSessionReport {
    return {
      version: 1,
      id: id,
      operation: operation,
      createdAt: Date.now(),
      device: deviceInfo.productModel + ' / ' + deviceInfo.osFullName,
      api: deviceInfo.sdkApiVersion,
      outcome: outcome,
      requested: '',
      observed: '',
      error: MediaReports.error('', 0, ''),
      metrics: [],
      events: []
    };
  }

  static playback(id: string, info: PlaybackInfo, outcome: string): MediaSessionReport {
    const report: MediaSessionReport = MediaReports.base(id, 'playback', outcome);
    report.nativeSessionId = info.diagnostics.sessionId;
    report.requested = info.diagnostics.requestedConfiguration;
    report.observed = info.diagnostics.observedConfiguration;
    report.error = MediaReports.error(info.failure.stage, info.failure.code, info.failure.message);
    report.metrics = [{ name: 'video.frames', amount: info.videoOutputFrames, unit: 'frames' },
      { name: 'video.dropped', amount: info.videoDroppedFrames, unit: 'frames' },
      { name: 'present.p95', amount: info.diagnostics.presentCallP95Us / 1000, unit: 'ms' },
      { name: 'sink.frame', amount: info.videoSinkDiagnostics.averageFrameUs / 1000, unit: 'ms' }];
    report.events = info.diagnostics.events.map((event: PlaybackTimelineEvent): MediaSessionEvent =>
      ({ elapsedMs: event.elapsedUs / 1000, stage: event.stage }));
    return report;
  }

  static transcode(id: string, status: TranscodeStatus, configuration: string): MediaSessionReport {
    const report: MediaSessionReport = MediaReports.base(id, 'transcode',
      status.state === 2 ? 'completed' : status.state === 3 ? 'cancelled' : 'failed');
    report.requested = configuration; report.observed = status.decoderName + ' -> ' + status.encoderName +
      ' / ' + status.outputWidth + 'x' + status.outputHeight;
    report.error = MediaReports.error(status.state === 2 ? '' : status.stage, status.errorCode,
      status.state === 2 ? '' : status.detail, status.state === 3);
    report.metrics = [{ name: 'video.fps', amount: status.fps, unit: 'fps' },
      { name: 'first.frame', amount: status.firstFrameMs, unit: 'ms' },
      { name: 'elapsed', amount: status.elapsedMs, unit: 'ms' },
      { name: 'copied', amount: status.copiedBytes, unit: 'bytes' }];
    status.diagnostics.forEach((metric: TranscodeMeasurement): void => {
      report.metrics.push({ name: metric.name + '.p95', amount: metric.p95Ms, unit: 'ms' });
    });
    report.events = [{ elapsedMs: status.elapsedMs, stage: status.stage }];
    return report;
  }

  static text(report: MediaSessionReport): string {
    return ['AVCodec session / schema ' + report.version, report.id + ' / ' + report.operation,
      'native session: ' + (report.nativeSessionId ?? ''),
      new Date(report.createdAt).toISOString(), report.device + ' / API ' + report.api, report.outcome,
      'requested: ' + report.requested, 'observed: ' + report.observed,
      'error: ' + report.error.category + ' / ' + report.error.stage + ' / ' + report.error.code,
      report.error.detail, report.metrics.map((metric: MediaSessionMetric): string =>
        metric.name + '=' + metric.amount.toFixed(3) + ' ' + metric.unit).join('\n'),
      report.events.map((event: MediaSessionEvent): string =>
        '+' + event.elapsedMs.toFixed(1) + 'ms ' + event.stage).join('\n')].join('\n');
  }
}
