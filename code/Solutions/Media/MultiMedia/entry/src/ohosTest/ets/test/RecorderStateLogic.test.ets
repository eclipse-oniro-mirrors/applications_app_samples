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
 * WITHOUT WARRANTIES OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import RecordModel from '../../../main/ets/model/RecordModel';
import type { AudioRecorderPort } from '../../../main/ets/model/RecordModel';
import {
  RecorderFake, RecorderFactoryFake, RecorderGate, recorderTick
} from '../utils/RecorderFakes';
import { LogicTestLog } from '../utils/LogicTestLog';

export default function RecorderStateLogicTest(): void {
  describe('RecorderStateLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await recorderTick();
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1000
     * @tc.name StateSequence1
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1000';
        const input: string =
          'states=idle';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['idle'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1001
     * @tc.name StateSequence2
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1001';
        const input: string =
          'states=prepared';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['prepared'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [1];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1002
     * @tc.name StateSequence3
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1002';
        const input: string =
          'states=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['started'];
        const expectedCallbacks: number[] = [1];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1003
     * @tc.name StateSequence4
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1003';
        const input: string =
          'states=paused';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['paused'];
        const expectedCallbacks: number[] = [1];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1004
     * @tc.name StateSequence5
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1004';
        const input: string =
          'states=stopped';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['stopped'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1005
     * @tc.name StateSequence6
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1005';
        const input: string =
          'states=released';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['released'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1006
     * @tc.name StateSequence7
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1006';
        const input: string =
          'states=error';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['error'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1007
     * @tc.name StateSequence8
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1007';
        const input: string =
          'states=draining';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['draining'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1008
     * @tc.name StateSequence9
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1008';
        const input: string =
          'states=';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = [''];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1009
     * @tc.name StateSequence10
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1009';
        const input: string =
          'states=Prepared';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['Prepared'];
        const expectedCallbacks: number[] = [0];
        const expectedStarts: number[] = [0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1010
     * @tc.name StateSequence11
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1010';
        const input: string =
          'states=idle/prepared/started/paused/started/stopped/released';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['idle', 'prepared', 'started', 'paused', 'started', 'stopped', 'released'];
        const expectedCallbacks: number[] = [0, 0, 1, 2, 3, 3, 3];
        const expectedStarts: number[] = [0, 1, 1, 1, 1, 1, 1];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.number(name, 'releasedStartCount', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1011
     * @tc.name StateSequence12
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1011';
        const input: string =
          'states=prepared/prepared/started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['prepared', 'prepared', 'started'];
        const expectedCallbacks: number[] = [0, 0, 1];
        const expectedStarts: number[] = [1, 2, 2];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedStartCount', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1012
     * @tc.name StateSequence13
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1012';
        const input: string =
          'states=paused/paused/started/paused';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['paused', 'paused', 'started', 'paused'];
        const expectedCallbacks: number[] = [1, 2, 3, 4];
        const expectedStarts: number[] = [0, 0, 0, 0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 4, callbacks);
        expect(callbacks).assertEqual(4);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1013
     * @tc.name StateSequence14
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1013';
        const input: string =
          'states=buffering/started/error/paused';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['buffering', 'started', 'error', 'paused'];
        const expectedCallbacks: number[] = [0, 1, 1, 2];
        const expectedStarts: number[] = [0, 0, 0, 0];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'releasedStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1014
     * @tc.name StateSequence15
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1014';
        const input: string =
          'states=prepared/idle/prepared/paused/started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['prepared', 'idle', 'prepared', 'paused', 'started'];
        const expectedCallbacks: number[] = [0, 0, 0, 1, 2];
        const expectedStarts: number[] = [1, 1, 2, 2, 2];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'releasedStartCount', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1015
     * @tc.name StateSequence16
     * @tc.desc Every emitted prefix preserves callback counts and prepared-start ordering.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1015';
        const input: string =
          'states=started/prepared/paused/prepared/started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const states: string[] = ['started', 'prepared', 'paused', 'prepared', 'started'];
        const expectedCallbacks: number[] = [1, 1, 2, 2, 3];
        const expectedStarts: number[] = [0, 1, 1, 2, 2];
        for (let step: number = 0; step < states.length; step++) {
          r1.emitState(states[step]);
          await recorderTick();
          LogicTestLog.number(name, 'prefixCallbacks', expectedCallbacks[step], callbacks);
          expect(callbacks).assertEqual(expectedCallbacks[step]);
          LogicTestLog.number(name, 'prefixStarts', expectedStarts[step], r1.callCount('start'));
          expect(r1.callCount('start')).assertEqual(expectedStarts[step]);
        }
        r1.emitError('recorder diagnostic without state transition');
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.release();
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'releasedCallbackCount', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.number(name, 'releasedStartCount', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedReferenceCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1016
     * @tc.name ReleasedState1
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1016';
        const input: string =
          'late=idle; replacementFd=201';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('idle');
        r1.emitError('late released error');
        await model.startRecorder(201);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('idle');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(201);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://201', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://201');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1017
     * @tc.name ReleasedState2
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1017';
        const input: string =
          'late=prepared; replacementFd=202';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('prepared');
        r1.emitError('late released error');
        await model.startRecorder(202);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('prepared');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(202);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://202', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://202');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1018
     * @tc.name ReleasedState3
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1018';
        const input: string =
          'late=started; replacementFd=203';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('started');
        r1.emitError('late released error');
        await model.startRecorder(203);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('started');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(203);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://203', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://203');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1019
     * @tc.name ReleasedState4
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1019';
        const input: string =
          'late=paused; replacementFd=204';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('paused');
        r1.emitError('late released error');
        await model.startRecorder(204);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('paused');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(204);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://204', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://204');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1020
     * @tc.name ReleasedState5
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1020';
        const input: string =
          'late=stopped; replacementFd=205';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('stopped');
        r1.emitError('late released error');
        await model.startRecorder(205);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('stopped');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(205);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://205', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://205');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1021
     * @tc.name ReleasedState6
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1021';
        const input: string =
          'late=released; replacementFd=206';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('released');
        r1.emitError('late released error');
        await model.startRecorder(206);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('released');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(206);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://206', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://206');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1022
     * @tc.name ReleasedState7
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1022';
        const input: string =
          'late=error; replacementFd=207';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('error');
        r1.emitError('late released error');
        await model.startRecorder(207);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('error');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(207);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://207', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://207');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1023
     * @tc.name ReleasedState8
     * @tc.desc Released and replaced callbacks cannot notify users or start either recorder.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1023';
        const input: string =
          'late=; replacementFd=208';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await model.release();
        r1.emitState('');
        r1.emitError('late released error');
        await model.startRecorder(208);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'lateReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'releasedPrepareCalls', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'beforeReplacement', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        let replacementCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          replacementCallbacks++;
        });
        r1.emitState('');
        r1.emitState('prepared');
        r1.emitState('paused');
        r1.emitError('late replaced error');
        await model.startRecorder(208);
        r2.emitState('prepared');
        r2.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'originalCallbacksUnchanged', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'oldStartStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://208', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://208');
        await model.finish();
        r2.emitState('started');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'finishedReplacementCallbacks', 2, replacementCallbacks);
        expect(replacementCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'finishedOriginalCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1024
     * @tc.name PreparedStartFailure1
     * @tc.desc Prepared-start rejection is handled without fabricated callbacks and a later start can recover.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1024';
        const input: string =
          'attempts=1; failure=AAC encoder start rejected; gated=false';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('start', 'AAC encoder start rejected');
        for (let attempt: number = 0; attempt < 1; attempt++) {
          r1.emitState('prepared');
        }
        await recorderTick();
        LogicTestLog.number(name, 'attemptedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'noFabricatedStartedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject'
        ];
        LogicTestLog.value(name, 'rejectedStarts', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('start');
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'stillRequiresStartedEvent', 0, callbacks);
        expect(callbacks).assertEqual(0);
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'realStateCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.finish();
        r1.emitState('prepared');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noStartAfterFinish', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        LogicTestLog.number(name, 'noCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1025
     * @tc.name PreparedStartFailure2
     * @tc.desc Prepared-start rejection is handled without fabricated callbacks and a later start can recover.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1025';
        const input: string =
          'attempts=2; failure=Recorder start service unavailable; gated=false';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('start', 'Recorder start service unavailable');
        for (let attempt: number = 0; attempt < 2; attempt++) {
          r1.emitState('prepared');
        }
        await recorderTick();
        LogicTestLog.number(name, 'attemptedStarts', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        LogicTestLog.number(name, 'noFabricatedStartedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.reject'
        ];
        LogicTestLog.value(name, 'rejectedStarts', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('start');
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'stillRequiresStartedEvent', 0, callbacks);
        expect(callbacks).assertEqual(0);
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'realStateCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.finish();
        r1.emitState('prepared');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noStartAfterFinish', 3, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(3);
        LogicTestLog.number(name, 'noCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.reject',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1026
     * @tc.name PreparedStartFailure3
     * @tc.desc Prepared-start rejection is handled without fabricated callbacks and a later start can recover.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1026';
        const input: string =
          'attempts=3; failure=Recorder start interrupted; gated=false';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('start', 'Recorder start interrupted');
        for (let attempt: number = 0; attempt < 3; attempt++) {
          r1.emitState('prepared');
        }
        await recorderTick();
        LogicTestLog.number(name, 'attemptedStarts', 3, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(3);
        LogicTestLog.number(name, 'noFabricatedStartedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.reject',
          'r1.start.enter', 'r1.start.reject'
        ];
        LogicTestLog.value(name, 'rejectedStarts', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('start');
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'stillRequiresStartedEvent', 0, callbacks);
        expect(callbacks).assertEqual(0);
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'realStateCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.finish();
        r1.emitState('prepared');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noStartAfterFinish', 4, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(4);
        LogicTestLog.number(name, 'noCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.reject',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1027
     * @tc.name PreparedStartFailure4
     * @tc.desc Prepared-start rejection is handled without fabricated callbacks and a later start can recover.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1027';
        const input: string =
          'attempts=1; failure=Recorder start resource exhausted; gated=true';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('start', 'Recorder start resource exhausted');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('start', gate);
        for (let attempt: number = 0; attempt < 1; attempt++) {
          r1.emitState('prepared');
        }
        await recorderTick();
        LogicTestLog.number(name, 'attemptedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'noFabricatedStartedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError', 'r1.start.enter'
        ];
        LogicTestLog.value(name, 'pendingStartCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject'
        ];
        LogicTestLog.value(name, 'rejectedStarts', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('start');
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'stillRequiresStartedEvent', 0, callbacks);
        expect(callbacks).assertEqual(0);
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'realStateCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.finish();
        r1.emitState('prepared');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noStartAfterFinish', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        LogicTestLog.number(name, 'noCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.reject', 'r1.start.enter', 'r1.start.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1028
     * @tc.name PreparedStartFailure5
     * @tc.desc Prepared-start rejection is handled without fabricated callbacks and a later start can recover.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1028';
        const input: string =
          'attempts=2; failure=Recorder start output not writable; gated=true';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('start', 'Recorder start output not writable');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('start', gate);
        for (let attempt: number = 0; attempt < 2; attempt++) {
          r1.emitState('prepared');
        }
        await recorderTick();
        LogicTestLog.number(name, 'attemptedStarts', 2, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(2);
        LogicTestLog.number(name, 'noFabricatedStartedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.enter'
        ];
        LogicTestLog.value(name, 'pendingStartCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.enter', 'r1.start.reject', 'r1.start.reject'
        ];
        LogicTestLog.value(name, 'rejectedStarts', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('start');
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'stillRequiresStartedEvent', 0, callbacks);
        expect(callbacks).assertEqual(0);
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'realStateCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.finish();
        r1.emitState('prepared');
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noStartAfterFinish', 3, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(3);
        LogicTestLog.number(name, 'noCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.enter', 'r1.start.reject', 'r1.start.reject',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1029
     * @tc.name CommandStateSequence1
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1029';
        const input: string =
          'commands=pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(301);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 3, callbacks);
        expect(callbacks).assertEqual(3);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1030
     * @tc.name CommandStateSequence2
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1030';
        const input: string =
          'commands=pause/pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(302);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const result2: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command2Void', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState2', 3, callbacks);
        expect(callbacks).assertEqual(3);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState2', 4, callbacks);
        expect(callbacks).assertEqual(4);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 4, callbacks);
        expect(callbacks).assertEqual(4);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1031
     * @tc.name CommandStateSequence3
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1031';
        const input: string =
          'commands=resume/pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(303);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const result2: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command2Void', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState2', 3, callbacks);
        expect(callbacks).assertEqual(3);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState2', 4, callbacks);
        expect(callbacks).assertEqual(4);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 4, callbacks);
        expect(callbacks).assertEqual(4);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1032
     * @tc.name CommandStateSequence4
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1032';
        const input: string =
          'commands=pause/resume/pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(304);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const result2: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command2Void', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState2', 3, callbacks);
        expect(callbacks).assertEqual(3);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState2', 4, callbacks);
        expect(callbacks).assertEqual(4);
        const result3: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command3Void', 'undefined', String(result3));
        expect(String(result3)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState3', 4, callbacks);
        expect(callbacks).assertEqual(4);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState3', 5, callbacks);
        expect(callbacks).assertEqual(5);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 5, callbacks);
        expect(callbacks).assertEqual(5);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1033
     * @tc.name CommandStateSequence5
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1033';
        const input: string =
          'commands=resume/resume/pause';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(305);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const result2: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command2Void', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState2', 3, callbacks);
        expect(callbacks).assertEqual(3);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState2', 4, callbacks);
        expect(callbacks).assertEqual(4);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.pause.enter', 'r1.pause.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 4, callbacks);
        expect(callbacks).assertEqual(4);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1034
     * @tc.name CommandStateSequence6
     * @tc.desc Pause and resume remain void and only subsequent paused or started events notify callers.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1034';
        const input: string =
          'commands=pause/resume/resume/pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(306);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'initialStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command0Void', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState0', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const result1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command1Void', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState1', 2, callbacks);
        expect(callbacks).assertEqual(2);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState1', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const result2: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command2Void', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState2', 3, callbacks);
        expect(callbacks).assertEqual(3);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState2', 4, callbacks);
        expect(callbacks).assertEqual(4);
        const result3: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'command3Void', 'undefined', String(result3));
        expect(String(result3)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState3', 4, callbacks);
        expect(callbacks).assertEqual(4);
        r1.emitState('paused');
        LogicTestLog.number(name, 'afterState3', 5, callbacks);
        expect(callbacks).assertEqual(5);
        const result4: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'command4Void', 'undefined', String(result4));
        expect(String(result4)).assertEqual('undefined');
        LogicTestLog.number(name, 'beforeState4', 5, callbacks);
        expect(callbacks).assertEqual(5);
        r1.emitState('started');
        LogicTestLog.number(name, 'afterState4', 6, callbacks);
        expect(callbacks).assertEqual(6);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve'
        ];
        LogicTestLog.value(name, 'commandsInOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.finish();
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 6, callbacks);
        expect(callbacks).assertEqual(6);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.resume.enter', 'r1.resume.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishAndNoFurtherCommands', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

  });
}
