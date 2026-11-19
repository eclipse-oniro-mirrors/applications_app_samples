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
import type { media } from '@kit.MediaKit';
import RecordModel from '../../../main/ets/model/RecordModel';
import type { AudioRecorderPort } from '../../../main/ets/model/RecordModel';
import {
  RecorderFake, RecorderFactoryFake, RecorderGate, recorderTick
} from '../utils/RecorderFakes';
import { LogicTestLog } from '../utils/LogicTestLog';

export default function RecorderConfigLogicTest(): void {
  describe('RecorderConfigLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await recorderTick();
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1035
     * @tc.name Descriptor1
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1035';
        const input: string =
          'fd=0';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(0);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://0', config.url);
        expect(config.url).assertEqual('fd://0');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(0);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1036
     * @tc.name Descriptor2
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1036';
        const input: string =
          'fd=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1', config.url);
        expect(config.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1037
     * @tc.name Descriptor3
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1037';
        const input: string =
          'fd=31';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(31);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://31', config.url);
        expect(config.url).assertEqual('fd://31');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(31);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1038
     * @tc.name Descriptor4
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1038';
        const input: string =
          'fd=32';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(32);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://32', config.url);
        expect(config.url).assertEqual('fd://32');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(32);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1039
     * @tc.name Descriptor5
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1039';
        const input: string =
          'fd=127';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(127);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://127', config.url);
        expect(config.url).assertEqual('fd://127');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(127);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1040
     * @tc.name Descriptor6
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1040';
        const input: string =
          'fd=255';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(255);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://255', config.url);
        expect(config.url).assertEqual('fd://255');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(255);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1041
     * @tc.name Descriptor7
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1041';
        const input: string =
          'fd=256';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(256);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://256', config.url);
        expect(config.url).assertEqual('fd://256');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(256);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1042
     * @tc.name Descriptor8
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1042';
        const input: string =
          'fd=1024';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1024);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1024', config.url);
        expect(config.url).assertEqual('fd://1024');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1024);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1043
     * @tc.name Descriptor9
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1043';
        const input: string =
          'fd=4096';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(4096);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://4096', config.url);
        expect(config.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(4096);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1044
     * @tc.name Descriptor10
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1044';
        const input: string =
          'fd=65535';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(65535);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://65535', config.url);
        expect(config.url).assertEqual('fd://65535');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(65535);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1045
     * @tc.name Descriptor11
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1045';
        const input: string =
          'fd=2147483647';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(2147483647);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://2147483647', config.url);
        expect(config.url).assertEqual('fd://2147483647');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(2147483647);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1046
     * @tc.name Descriptor12
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1046';
        const input: string =
          'fd=9007199254740991';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(9007199254740991);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://9007199254740991', config.url);
        expect(config.url).assertEqual('fd://9007199254740991');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(9007199254740991);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1047
     * @tc.name Descriptor13
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1047';
        const input: string =
          'fd=-1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-1);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://-1', config.url);
        expect(config.url).assertEqual('fd://-1');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(-1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1048
     * @tc.name Descriptor14
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1048';
        const input: string =
          'fd=-17';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-17);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://-17', config.url);
        expect(config.url).assertEqual('fd://-17');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(-17);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1049
     * @tc.name Descriptor15
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1049';
        const input: string =
          'fd=1.25';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1.25);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1.25', config.url);
        expect(config.url).assertEqual('fd://1.25');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1.25);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1050
     * @tc.name RepeatedConfig1
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1050';
        const input: string =
          'first=1; second=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(1);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://1', first.url);
        expect(first.url).assertEqual('fd://1');
        LogicTestLog.value(name, 'secondUrl', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1051
     * @tc.name RepeatedConfig2
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1051';
        const input: string =
          'first=0; second=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(0);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(1);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://0', first.url);
        expect(first.url).assertEqual('fd://0');
        LogicTestLog.value(name, 'secondUrl', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1052
     * @tc.name RepeatedConfig3
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1052';
        const input: string =
          'first=255; second=256';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(255);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(256);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://255', first.url);
        expect(first.url).assertEqual('fd://255');
        LogicTestLog.value(name, 'secondUrl', 'fd://256', second.url);
        expect(second.url).assertEqual('fd://256');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(256);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1053
     * @tc.name RepeatedConfig4
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1053';
        const input: string =
          'first=4095; second=4096';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(4095);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(4096);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://4095', first.url);
        expect(first.url).assertEqual('fd://4095');
        LogicTestLog.value(name, 'secondUrl', 'fd://4096', second.url);
        expect(second.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(4096);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1054
     * @tc.name RepeatedConfig5
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1054';
        const input: string =
          'first=-1; second=42';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-1);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(42);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://-1', first.url);
        expect(first.url).assertEqual('fd://-1');
        LogicTestLog.value(name, 'secondUrl', 'fd://42', second.url);
        expect(second.url).assertEqual('fd://42');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(42);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1055
     * @tc.name RepeatedConfig6
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1055';
        const input: string =
          'first=1.25; second=2.5';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1.25);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(2.5);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://1.25', first.url);
        expect(first.url).assertEqual('fd://1.25');
        LogicTestLog.value(name, 'secondUrl', 'fd://2.5', second.url);
        expect(second.url).assertEqual('fd://2.5');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(2.5);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1056
     * @tc.name RepeatedConfig7
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1056';
        const input: string =
          'first=2147483647; second=2147483648';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(2147483647);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(2147483648);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://2147483647', first.url);
        expect(first.url).assertEqual('fd://2147483647');
        LogicTestLog.value(name, 'secondUrl', 'fd://2147483648', second.url);
        expect(second.url).assertEqual('fd://2147483648');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(2147483648);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1057
     * @tc.name RepeatedConfig8
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1057';
        const input: string =
          'first=9007199254740990; second=9007199254740991';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(9007199254740990);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(9007199254740991);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://9007199254740990', first.url);
        expect(first.url).assertEqual('fd://9007199254740990');
        LogicTestLog.value(name, 'secondUrl', 'fd://9007199254740991', second.url);
        expect(second.url).assertEqual('fd://9007199254740991');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(9007199254740991);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1058
     * @tc.name InstanceIsolation1
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1058';
        const input: string =
          'a=11; b=12; again=13; mutated=96000/1/16000';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(11);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-0';
        first.profile.audioBitrate = 96000;
        first.profile.audioChannels = 1;
        first.profile.audioSampleRate = 16000;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(12);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://12', second.url);
        expect(second.url).assertEqual('fd://12');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-0', first.url);
        expect(first.url).assertEqual('fd://mutated-0');
        await model.startRecorder(13);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://13', again.url);
        expect(again.url).assertEqual('fd://13');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://12', second.url);
        expect(second.url).assertEqual('fd://12');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1059
     * @tc.name InstanceIsolation2
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1059';
        const input: string =
          'a=0; b=0; again=1; mutated=128000/4/22050';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(0);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-1';
        first.profile.audioBitrate = 128000;
        first.profile.audioChannels = 4;
        first.profile.audioSampleRate = 22050;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(0);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://0', second.url);
        expect(second.url).assertEqual('fd://0');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-1', first.url);
        expect(first.url).assertEqual('fd://mutated-1');
        await model.startRecorder(1);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://1', again.url);
        expect(again.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://0', second.url);
        expect(second.url).assertEqual('fd://0');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1060
     * @tc.name InstanceIsolation3
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1060';
        const input: string =
          'a=255; b=256; again=257; mutated=192000/6/44100';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(255);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-2';
        first.profile.audioBitrate = 192000;
        first.profile.audioChannels = 6;
        first.profile.audioSampleRate = 44100;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(256);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://256', second.url);
        expect(second.url).assertEqual('fd://256');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-2', first.url);
        expect(first.url).assertEqual('fd://mutated-2');
        await model.startRecorder(257);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://257', again.url);
        expect(again.url).assertEqual('fd://257');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://256', second.url);
        expect(second.url).assertEqual('fd://256');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1061
     * @tc.name InstanceIsolation4
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1061';
        const input: string =
          'a=4095; b=4096; again=4097; mutated=64000/8/96000';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(4095);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-3';
        first.profile.audioBitrate = 64000;
        first.profile.audioChannels = 8;
        first.profile.audioSampleRate = 96000;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(4096);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://4096', second.url);
        expect(second.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-3', first.url);
        expect(first.url).assertEqual('fd://mutated-3');
        await model.startRecorder(4097);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://4097', again.url);
        expect(again.url).assertEqual('fd://4097');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://4096', second.url);
        expect(second.url).assertEqual('fd://4096');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1062
     * @tc.name InstanceIsolation5
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1062';
        const input: string =
          'a=2147483647; b=1; again=2; mutated=256000/7/192000';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(2147483647);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-4';
        first.profile.audioBitrate = 256000;
        first.profile.audioChannels = 7;
        first.profile.audioSampleRate = 192000;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(1);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-4', first.url);
        expect(first.url).assertEqual('fd://mutated-4');
        await model.startRecorder(2);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://2', again.url);
        expect(again.url).assertEqual('fd://2');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1063
     * @tc.name InstanceIsolation6
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1063';
        const input: string =
          'a=1.25; b=2.5; again=3.75; mutated=160000/1/24000';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1.25);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-5';
        first.profile.audioBitrate = 160000;
        first.profile.audioChannels = 1;
        first.profile.audioSampleRate = 24000;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(2.5);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://2.5', second.url);
        expect(second.url).assertEqual('fd://2.5');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'firstMutationRetained', 'fd://mutated-5', first.url);
        expect(first.url).assertEqual('fd://mutated-5');
        await model.startRecorder(3.75);
        const again: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'nextConfigFreshExpectedTrue', first !== again);
        expect(first !== again).assertTrue();
        LogicTestLog.flag(name, 'nextProfileFreshExpectedTrue', first.profile !== again.profile);
        expect(first.profile !== again.profile).assertTrue();
        LogicTestLog.flag(name, 'nextProfileNotOtherExpectedTrue', again.profile !== second.profile);
        expect(again.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'againUrl', 'fd://3.75', again.url);
        expect(again.url).assertEqual('fd://3.75');
        LogicTestLog.number(name, 'againBitrate', 48000, Number(again.profile.audioBitrate));
        expect(Number(again.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'againChannels', 2, Number(again.profile.audioChannels));
        expect(Number(again.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'againSampleRate', 48000, Number(again.profile.audioSampleRate));
        expect(Number(again.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'againCodec', 'audio/mp4a-latm', String(again.profile.audioCodec));
        expect(String(again.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'againContainer', 'm4a', String(again.profile.fileFormat));
        expect(String(again.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'againSource', '1', String(again.audioSourceType));
        expect(String(again.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'otherDescriptorStable', 'fd://2.5', second.url);
        expect(second.url).assertEqual('fd://2.5');
        r1.emitState('started');
        r2.emitState('paused');
        LogicTestLog.number(name, 'modelCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'modelConfigCount', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.number(name, 'otherConfigCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        await model.release();
        await other.release();
        r1.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'modelReleasedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'otherReleasedCallbacks', 1, otherCallbacks);
        expect(otherCallbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1064
     * @tc.name PendingPrepare1
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1064';
        const input: string =
          'fd=17; next=18; failure=none';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(17).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://17', first.url);
        expect(first.url).assertEqual('fd://17');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.value(name, 'prepareFailure', '', failure);
        expect(failure).assertEqual('');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(18);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://18', second.url);
        expect(second.url).assertEqual('fd://18');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://17', first.url);
        expect(first.url).assertEqual('fd://17');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1065
     * @tc.name PendingPrepare2
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1065';
        const input: string =
          'fd=1023; next=1024; failure=none';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(1023).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://1023', first.url);
        expect(first.url).assertEqual('fd://1023');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.value(name, 'prepareFailure', '', failure);
        expect(failure).assertEqual('');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(1024);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://1024', second.url);
        expect(second.url).assertEqual('fd://1024');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://1023', first.url);
        expect(first.url).assertEqual('fd://1023');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1066
     * @tc.name PendingPrepare3
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1066';
        const input: string =
          'fd=65535; next=65536; failure=none';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(65535).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://65535', first.url);
        expect(first.url).assertEqual('fd://65535');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.value(name, 'prepareFailure', '', failure);
        expect(failure).assertEqual('');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(65536);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://65536', second.url);
        expect(second.url).assertEqual('fd://65536');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://65535', first.url);
        expect(first.url).assertEqual('fd://65535');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1067
     * @tc.name PendingPrepare4
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1067';
        const input: string =
          'fd=0; next=1; failure=Prepare output descriptor rejected';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        r1.fail('prepare', 'Prepare output descriptor rejected');
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(0).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://0', first.url);
        expect(first.url).assertEqual('fd://0');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'prepareFailure', 'Prepare output descriptor rejected', failure);
        expect(failure).assertEqual('Prepare output descriptor rejected');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(1);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://0', first.url);
        expect(first.url).assertEqual('fd://0');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1068
     * @tc.name PendingPrepare5
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1068';
        const input: string =
          'fd=4096; next=4097; failure=Prepare encoder configuration rejected';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        r1.fail('prepare', 'Prepare encoder configuration rejected');
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(4096).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://4096', first.url);
        expect(first.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'prepareFailure', 'Prepare encoder configuration rejected', failure);
        expect(failure).assertEqual('Prepare encoder configuration rejected');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(4097);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://4097', second.url);
        expect(second.url).assertEqual('fd://4097');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://4096', first.url);
        expect(first.url).assertEqual('fd://4096');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1069
     * @tc.name PendingPrepare6
     * @tc.desc Prepare awaits completion, propagates failure, and retains the recorder for a fresh subsequent
     * prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1069';
        const input: string =
          'fd=2147483647; next=2; failure=Prepare recorder service fault';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('prepare', gate);
        r1.fail('prepare', 'Prepare recorder service fault');
        let completed: boolean = false;
        let failure: string = '';
        const preparing: Promise<void> = model.startRecorder(2147483647).then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'preparePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'noPrematureFailure', '', failure);
        expect(failure).assertEqual('');
        LogicTestLog.number(name, 'pendingConfigCaptured', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'firstUrl', 'fd://2147483647', first.url);
        expect(first.url).assertEqual('fd://2147483647');
        LogicTestLog.number(name, 'firstBitrate', 48000, Number(first.profile.audioBitrate));
        expect(Number(first.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'firstChannels', 2, Number(first.profile.audioChannels));
        expect(Number(first.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'firstSampleRate', 48000, Number(first.profile.audioSampleRate));
        expect(Number(first.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'firstCodec', 'audio/mp4a-latm', String(first.profile.audioCodec));
        expect(String(first.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'firstContainer', 'm4a', String(first.profile.fileFormat));
        expect(String(first.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'firstSource', '1', String(first.audioSourceType));
        expect(String(first.audioSourceType)).assertEqual('1');
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter'
        ];
        LogicTestLog.value(name, 'preparePendingHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await preparing;
        LogicTestLog.flag(name, 'prepareCompletedExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'prepareFailure', 'Prepare recorder service fault', failure);
        expect(failure).assertEqual('Prepare recorder service fault');
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject'
        ];
        LogicTestLog.value(name, 'prepareSettledHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        r1.recover('prepare');
        await model.startRecorder(2);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.flag(name, 'recoveryConfigFreshExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'recoveryProfileFreshExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'recoveryDescriptor', 'fd://2', second.url);
        expect(second.url).assertEqual('fd://2');
        LogicTestLog.value(name, 'originalDescriptorRetained', 'fd://2147483647', first.url);
        expect(first.url).assertEqual('fd://2147483647');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.reject', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

  });
}
