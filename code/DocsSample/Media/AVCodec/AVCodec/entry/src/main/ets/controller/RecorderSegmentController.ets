/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CameraDataModel } from '../model/CameraDataModel';
import { RecorderDiagnostics } from 'librecorder.so';
import { RecordingResultInfo } from './RecordingSessionController';
import { RecordingSegmentInfo } from '../model/RecordingHistoryModel';

export class RecorderSegmentController {
  public static readonly MAX_SEGMENTS: number = 1000;
  private startedAt: number = 0;
  private pieces: RecordingSegmentInfo[] = [];
  private allComplete: boolean = true;

  started(now: number): void { this.startedAt = now; }
  canContinue(): boolean { return this.pieces.length < RecorderSegmentController.MAX_SEGMENTS; }
  due(data: CameraDataModel, snapshot: RecorderDiagnostics, now: number): boolean {
    if (data.outputFormat !== 2 || !snapshot.active || snapshot.failure.stage.length > 0 ||
      (snapshot.endReason.length > 0 && snapshot.endReason !== 'user_stop')) { return false; }
    const time: boolean = data.segmentSeconds > 0 && now - this.startedAt >= data.segmentSeconds * 1000;
    const bytes: number = Math.max(snapshot.primary.fileBytes,
      data.enableDualOutput ? snapshot.secondary.fileBytes : 0);
    return time || (data.segmentMiB > 0 && bytes >= data.segmentMiB * 1048576);
  }
  add(result: RecordingResultInfo | undefined): void {
    if (result === undefined || this.pieces.some((item: RecordingSegmentInfo): boolean =>
      item.sessionId === result.sessionId)) { return; }
    this.allComplete = this.allComplete && result.complete;
    this.pieces.push({ sessionId: result.sessionId, uri: result.primaryUri, secondaryUri: result.secondaryUri,
      title: result.title, recordedAt: result.recordedAt, durationSeconds: result.durationSeconds,
      complete: result.complete, validation: result.validation });
  }
  result(groupId: string, failed: boolean = false): RecordingResultInfo | undefined {
    const first: RecordingSegmentInfo | undefined = this.pieces[0];
    if (first === undefined) { return undefined; }
    return { sessionId: groupId || first.sessionId, recordedAt: first.recordedAt,
      durationSeconds: this.pieces.reduce((sum: number, item: RecordingSegmentInfo): number =>
        sum + item.durationSeconds, 0), title: first.title, primaryUri: first.uri, secondaryUri: first.secondaryUri,
      complete: this.allComplete && !failed, validation: first.validation, segments: this.pieces.slice() };
  }
}
