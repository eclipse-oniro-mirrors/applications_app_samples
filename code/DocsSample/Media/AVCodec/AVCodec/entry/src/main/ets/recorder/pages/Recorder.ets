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

import { common } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import recorder from 'librecorder.so';
import { LocalizedText } from '../../common/LocalizedText';
import { dateTime } from '../../common/utils/DateTimeUtil';
import { CameraDataModel } from '../../model/CameraDataModel';
import { RecordingHistoryModel } from '../../model/RecordingHistoryModel';
import { RecordingPhase, RecordingResultInfo, RecordingSessionController } from '../../controller/RecordingSessionController';
import { CameraSessionController } from '../../controller/CameraSessionController';
import { RecorderDiagnosticsController } from '../../controller/RecorderDiagnosticsController';
import { RecorderSegmentController } from '../../controller/RecorderSegmentController';
import { RecorderLaunchController } from '../../controller/RecorderLaunchController';
import { RecorderLiveParameters } from '../../components/recorder/RecorderLiveParameters';
import { RecorderDiagnosticsPanel } from '../../components/recorder/RecorderDiagnosticsPanel';
import Logger from '../../common/utils/Logger';

@Entry
@Component
struct Recorder {
  @State private phase: RecordingPhase = RecordingPhase.PREPARING;
  @State private elapsed: number = 0;
  @State private compact: string = '';
  @State private details: string = '';
  private data: CameraDataModel = new CameraDataModel();
  private session: RecordingSessionController = new RecordingSessionController();
  private camera: CameraSessionController = new CameraSessionController();
  private diagnostics: RecorderDiagnosticsController = new RecorderDiagnosticsController();
  private segments: RecorderSegmentController = new RecorderSegmentController();
  private launch: RecorderLaunchController = new RecorderLaunchController();
  private switchingTask: Promise<void> | undefined = undefined;
  private ending: boolean = false;
  private showResultOnFinish: boolean = true;
  private segmentFailed: boolean = false;
  private currentFinalized: boolean = false;
  private previewController: XComponentController = new XComponentController();
  private finishTask: Promise<void> | undefined = undefined;
  private result: RecordingResultInfo | undefined = undefined;
  private startedAt: number = 0;
  private canNavigate: boolean = true;
  private navigating: boolean = false;
  private zoom: number = 1;

  aboutToAppear(): void {
    this.data = this.getUIContext().getRouter().getParams() as CameraDataModel;
  }

  onBackPress(): boolean { void this.finish(false); return true; }
  onPageHide(): void {
    if (!this.navigating) { this.canNavigate = false; void this.finish(false); }
  }
  onPageShow(): void {
    this.canNavigate = true;
    if (this.finishTask !== undefined) { void this.finishTask.then((): void => this.navigate(false)); }
  }
  aboutToDisappear(): void { this.canNavigate = false; this.diagnostics.stop(); void this.finish(false); }

  private async prepare(): Promise<void> {
    try {
      await this.camera.prepare(this.getUIContext(), this.data, this.previewController.getXComponentSurfaceId());
      this.session.ready();
      if (this.session.phase === RecordingPhase.READY) { this.phase = RecordingPhase.READY; }
    } catch (error) {
      this.session.mark('camera.failed', 'prepare_failed');
      this.compact = LocalizedText.get($r('app.string.recorder_start_failed'));
      Logger.error('Recorder', JSON.stringify(error));
      await this.finish(true);
    }
  }

  private async start(): Promise<void> {
    if (this.phase !== RecordingPhase.READY) { return; }
    this.phase = RecordingPhase.PREPARING;
    try {
      await this.beginCapture();
    } catch (error) {
      this.session.mark('camera.failed', 'start_failed');
      Logger.error('Recorder', JSON.stringify(error));
      await this.finish(true);
    }
  }

  private async beginCapture(): Promise<void> {
    if (!this.session.start()) { throw new Error('Native recorder start failed'); }
    await this.camera.start();
    this.session.mark('camera.started');
    if (this.ending) { return; }
    this.phase = RecordingPhase.RECORDING;
    this.startedAt = Date.now();
    this.segments.started(this.startedAt);
    this.diagnostics.start(this.data.enableDualOutput, this.data.stopOnLowSpace,
      (compact: string, details: string): void => {
        this.compact = compact; this.details = details;
        this.elapsed = Math.floor((Date.now() - this.startedAt) / 1000);
        if (this.segments.due(this.data, recorder.getDiagnostics(), Date.now())) { this.rotateSegment(); }
      }, (): void => {
        if (this.data.stopOnLowSpace && recorder.getDiagnostics().active &&
          recorder.getDiagnostics().failure.stage.length === 0) { this.session.mark('storage.stop_requested'); }
        void this.finish(true);
      });
  }

  private rotateSegment(): void {
    if (this.switchingTask !== undefined || this.ending || this.phase !== RecordingPhase.RECORDING) { return; }
    this.phase = RecordingPhase.FINALIZING;
    this.diagnostics.stop();
    this.compact = LocalizedText.get($r('app.string.rec_segments_switching'));
    this.switchingTask = this.switchSegment();
    void this.switchingTask.finally((): void => {
      this.switchingTask = undefined;
      if (this.ending) { void this.finish(this.showResultOnFinish); }
    });
  }

  private async finalizeSegment(): Promise<void> {
    if (this.currentFinalized) { return; }
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    const result = await this.session.finish(context, this.data,
      (): Promise<void> => this.stopCamera(), (): Promise<void> => this.camera.release());
    this.currentFinalized = true;
    this.segments.add(result);
    if (result?.complete !== true) { this.segmentFailed = true; this.ending = true; }
  }

  private async switchSegment(): Promise<void> {
    try {
      await this.finalizeSegment();
      if (this.ending || !this.canNavigate) { return; }
      if (!this.segments.canContinue()) {
        this.ending = true;
        this.getUIContext().getPromptAction().showToast({
          message: LocalizedText.get($r('app.string.rec_segments_limit_reached'))
        });
        return;
      }
      this.data.segmentIndex++;
      const launched: boolean = await this.launch.launch(this.getUIContext(), this.data, false);
      if (launched || recorder.getDiagnostics().active) {
        this.currentFinalized = false;
        this.session = new RecordingSessionController();
        this.camera = new CameraSessionController();
      }
      if (!launched) { throw new Error('Unable to initialize the next recording segment'); }
      if (this.ending) { return; }
      await this.camera.prepare(this.getUIContext(), this.data, this.previewController.getXComponentSurfaceId());
      this.session.ready();
      if (!this.ending) { await this.beginCapture(); }
    } catch (error) {
      this.segmentFailed = true; this.ending = true;
      Logger.error('Recorder', 'Segment switch failed: ' + JSON.stringify(error));
    }
  }

  private async stopCamera(): Promise<void> {
    let timer: number = -1;
    let complete: (() => void) | undefined = undefined;
    const frameEnd = new Promise<void>((resolve: () => void): void => { complete = resolve; });
    timer = setTimeout((): void => {
      this.session.mark('camera.frame_end_timeout', 'timeout');
      complete?.();
    }, 5000);
    try {
      const waiting: boolean = await this.camera.stop((): void => {
        this.session.mark('camera.frame_end'); complete?.();
      });
      if (waiting) { await frameEnd; }
    } catch (_error) {
      this.session.mark('camera.failed', 'stop_failed');
      await this.camera.release();
    } finally { clearTimeout(timer); }
  }

  private async finish(showResult: boolean): Promise<void> {
    this.ending = true;
    // A Back/hide request wins over an automatic failure result during segment switching.
    this.showResultOnFinish = this.showResultOnFinish && showResult;
    this.diagnostics.stop();
    if (this.finishTask === undefined) {
      this.phase = RecordingPhase.FINALIZING;
      this.finishTask = this.finalize();
    }
    await this.finishTask;
  }

  private async finalize(): Promise<void> {
    try {
      if (this.switchingTask !== undefined) { await this.switchingTask; }
      await this.finalizeSegment();
      this.result = this.segments.result(this.data.recordingGroupId, this.segmentFailed);
      this.phase = this.result?.complete === true ? RecordingPhase.FINISHED : RecordingPhase.FAILED;
    } catch (error) {
      this.result = this.segments.result(this.data.recordingGroupId, true);
      this.phase = RecordingPhase.FAILED;
      this.compact = LocalizedText.get($r('app.string.recorder_finalize_failed'));
      Logger.error('Recorder', JSON.stringify(error));
    }
    if (this.result?.complete === false) {
      try {
        const history = new RecordingHistoryModel();
        await history.load(this.getUIContext().getHostContext() as common.UIAbilityContext);
        await history.markIncomplete(this.data.recordingGroupId);
      } catch (error) { Logger.warn('Recorder', 'History update failed: ' + JSON.stringify(error)); }
    }
    this.navigate(this.showResultOnFinish);
  }

  private navigate(showResult: boolean): void {
    if (!this.canNavigate || this.navigating) { return; }
    this.navigating = true;
    if (showResult && this.result !== undefined) {
      void this.getUIContext().getRouter().replaceUrl({ url: 'recorder/pages/RecordingResult',
        params: this.result }).catch((): void => {
          this.navigating = false;
          this.getUIContext().getRouter().back();
        });
    } else { this.getUIContext().getRouter().back(); }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      XComponent({ id: 'recorderXComponent', type: 0, controller: this.previewController })
        .onLoad((): void => { void this.prepare(); })
        .width('100%')
        .height((display.getDefaultDisplaySync().width * this.data.cameraWidth / this.data.cameraHeight) + 'px')
        .gesture(PinchGesture()
          .onActionUpdate((event: GestureEvent): void => this.camera.zoom(this.zoom * event.scale))
          .onActionEnd((): void => { this.zoom = this.camera.zoomRatio(); }))
      Column() {
        Column({ space: 8 }) {
          if (this.phase === RecordingPhase.RECORDING) {
            Text(dateTime(this.elapsed)).fontSize(27).fontColor(Color.White)
          }
          if (this.compact.length > 0) {
            RecorderDiagnosticsPanel({ compactText: this.compact, detailText: this.details,
              detailHeight: Math.min(220, this.getUIContext().px2vp(display.getDefaultDisplaySync().height) * 0.24) })
          }
        }.width('100%').hitTestBehavior(HitTestMode.Transparent)
        Column({ space: 8 }) {
          if (this.phase === RecordingPhase.RECORDING) {
            RecorderLiveParameters({ recording: true, dualOutput: this.data.enableDualOutput })
          }
          Button(this.phase === RecordingPhase.RECORDING ? $r('app.string.end_recording') :
            this.phase === RecordingPhase.FINALIZING ? $r('app.string.rec_result_finalizing') : $r('app.string.start_recording'))
            .backgroundColor('#E67E22').fontColor(Color.White)
            .enabled(this.phase === RecordingPhase.READY || this.phase === RecordingPhase.RECORDING)
            .onClick((): void => {
              if (this.phase === RecordingPhase.READY) { void this.start(); } else { void this.finish(true); }
            })
        }.width('100%')
      }.width('100%').height('100%').padding({ left: 12, right: 12, top: 16, bottom: 24 })
        .justifyContent(FlexAlign.SpaceBetween).hitTestBehavior(HitTestMode.Transparent)
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
