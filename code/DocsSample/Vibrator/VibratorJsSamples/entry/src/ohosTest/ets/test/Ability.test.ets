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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { bundleManager, common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { vibrator } from '@kit.SensorServiceKit';
import { fileIo, ReadOptions } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorEntryResource';
const RAW_FILE: string = 'vibrator.json';

// Explicit types describe the real main resource schema; no copied payload or generated fixture.
interface RawMetadata {
  Create: string;
  Description: string;
  Version: number;
  ChannelNumber: number;
}

interface RawParameters {
  Intensity: number;
  Frequency: number;
}

interface RawEvent {
  Type: string;
  StartTime: number;
  Duration: number;
  Parameters: RawParameters;
}

interface RawPatternItem {
  Event: RawEvent;
}

interface RawChannelParameters {
  Index: number;
}

interface RawChannel {
  Parameters: RawChannelParameters;
  Pattern: RawPatternItem[];
}

interface RawPattern {
  MetaData: RawMetadata;
  Channels: RawChannel[];
}

function entryResources(): resourceManager.ResourceManager {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  const entryContext: common.Context = context.createModuleContext('entry');
  return entryContext.resourceManager;
}

function decodeRaw(bytes: Uint8Array): string {
  const decoder: util.TextDecoder = new util.TextDecoder('utf-8', { fatal: true });
  return decoder.decodeToString(bytes);
}

function mainModule(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo {
  for (const module of info.hapModulesInfo) {
    if (module.name === 'entry') {
      return module;
    }
  }
  throw new Error('Installed bundle is missing the real entry module');
}

export default function abilityTest(): void {
  describe('VibratorEntryResourceMatrix', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0001
     * @tc.name testVibratorEntry0001
     * @tc.desc 查询实际安装主模块入口及设备类型，并从entry而非测试模块解析页面按钮资源。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVibratorEntry0001', 0, async (): Promise<void> => {
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      hilog.info(DOMAIN, TAG, 'Installed bundle=%{public}s', info.name);
      expect(info.name).assertEqual('com.samples.vibrator');
      const module: bundleManager.HapModuleInfo = mainModule(info);
      hilog.info(DOMAIN, TAG, 'Main module entry=%{public}s', module.mainElementName);
      expect(module.mainElementName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, 'Main module devices=%{public}s', module.deviceTypes.join(','));
      expect(module.deviceTypes.includes('default')).assertTrue();
      const manager: resourceManager.ResourceManager = entryResources();
      const label: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, 'Main module label=%{public}s', label);
      expect(label).assertEqual('VibratorJsSamples');
      const continuousButton: string = manager.getStringByNameSync('addContinuousEvent');
      hilog.info(DOMAIN, TAG, 'Main continuous button=%{public}s', continuousButton);
      expect(continuousButton).assertEqual('pattern:addContinuousEvent');
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0002
     * @tc.name testVibratorEntry0002
     * @tc.desc 读取真实entry振动资源，验证单通道index1和两个15毫秒长事件及10毫秒间隔。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorEntry0002', 0, (): void => {
      const bytes: Uint8Array = entryResources().getRawFileContentSync(RAW_FILE);
      const raw: RawPattern = JSON.parse(decodeRaw(bytes)) as RawPattern;
      hilog.info(DOMAIN, TAG, 'Raw metadata channels=%{public}d', raw.MetaData.ChannelNumber);
      expect(raw.MetaData.ChannelNumber).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Raw actual channels=%{public}d', raw.Channels.length);
      expect(raw.Channels.length).assertEqual(raw.MetaData.ChannelNumber);
      const channel: RawChannel = raw.Channels[0];
      hilog.info(DOMAIN, TAG, 'Raw channel index=%{public}d', channel.Parameters.Index);
      expect(channel.Parameters.Index).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Raw event count=%{public}d', channel.Pattern.length);
      expect(channel.Pattern.length).assertEqual(2);
      for (const item of channel.Pattern) {
        hilog.info(DOMAIN, TAG, 'Raw event type=%{public}s', item.Event.Type);
        expect(item.Event.Type).assertEqual('continuous');
        hilog.info(DOMAIN, TAG, 'Raw event duration=%{public}d', item.Event.Duration);
        expect(item.Event.Duration).assertEqual(15);
        hilog.info(DOMAIN, TAG, 'Raw event intensity=%{public}d', item.Event.Parameters.Intensity);
        expect(item.Event.Parameters.Intensity).assertEqual(100);
        hilog.info(DOMAIN, TAG, 'Raw event frequency=%{public}d', item.Event.Parameters.Frequency);
        expect(item.Event.Parameters.Frequency).assertEqual(50);
      }
      const first: RawEvent = channel.Pattern[0].Event;
      const second: RawEvent = channel.Pattern[1].Event;
      hilog.info(DOMAIN, TAG, 'Raw first start=%{public}d', first.StartTime);
      expect(first.StartTime).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'Raw second start=%{public}d', second.StartTime);
      expect(second.StartTime).assertEqual(25);
      const gap: number = second.StartTime - first.StartTime - first.Duration;
      hilog.info(DOMAIN, TAG, 'Raw event gap=%{public}d', gap);
      expect(gap).assertEqual(10);
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0003
     * @tc.name testVibratorEntry0003
     * @tc.desc 按真实raw fd偏移长度读取并交叉比对资源字节，验证结束40毫秒且finally关闭fd。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorEntry0003', 0, (): void => {
      const manager: resourceManager.ResourceManager = entryResources();
      const expectedBytes: Uint8Array = manager.getRawFileContentSync(RAW_FILE);
      const descriptor: resourceManager.RawFileDescriptor = manager.getRawFdSync(RAW_FILE);
      try {
        const buffer: ArrayBuffer = new ArrayBuffer(descriptor.length);
        const readOptions: ReadOptions = { offset: descriptor.offset, length: descriptor.length };
        const readLength: number = fileIo.readSync(descriptor.fd, buffer, readOptions);
        hilog.info(DOMAIN, TAG, 'Raw fd read=%{public}d resource bytes=%{public}d', readLength, expectedBytes.length);
        expect(readLength).assertEqual(expectedBytes.length);
        const actualText: string = decodeRaw(new Uint8Array(buffer, 0, readLength));
        const expectedText: string = decodeRaw(expectedBytes);
        hilog.info(DOMAIN, TAG, 'Raw fd content lengths=%{public}d/%{public}d', actualText.length, expectedText.length);
        expect(actualText).assertEqual(expectedText);
        const raw: RawPattern = JSON.parse(actualText) as RawPattern;
        const events: RawPatternItem[] = raw.Channels[0].Pattern;
        let totalDuration: number = 0;
        let end: number = 0;
        for (const item of events) {
          totalDuration += item.Event.Duration;
          end = Math.max(end, item.Event.StartTime + item.Event.Duration);
        }
        hilog.info(DOMAIN, TAG, 'Raw fd total duration=%{public}d', totalDuration);
        expect(totalDuration).assertEqual(30);
        hilog.info(DOMAIN, TAG, 'Raw fd end time=%{public}d', end);
        expect(end).assertEqual(40);
      } finally {
        manager.closeRawFdSync(RAW_FILE);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0004
     * @tc.name testVibratorEntry0004
     * @tc.desc 将实际raw资源的两个长事件送入构造器，检查相对起点、总时长及通道映射，不播放。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorEntry0004', 0, (): void => {
      const bytes: Uint8Array = entryResources().getRawFileContentSync(RAW_FILE);
      const raw: RawPattern = JSON.parse(decodeRaw(bytes)) as RawPattern;
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      for (const channel of raw.Channels) {
        for (const item of channel.Pattern) {
          const event: RawEvent = item.Event;
          const options: vibrator.ContinuousParam = {
            intensity: event.Parameters.Intensity,
            frequency: event.Parameters.Frequency,
            index: channel.Parameters.Index
          };
          builder.addContinuousEvent(event.StartTime, event.Duration, options);
        }
      }
      const pattern: vibrator.VibratorPattern = builder.build();
      hilog.info(DOMAIN, TAG, 'Resource-built count=%{public}d', pattern.events.length);
      expect(pattern.events.length).assertEqual(2);
      let duration: number = 0;
      let end: number = 0;
      const starts: number[] = [];
      for (const event of pattern.events) {
        hilog.info(DOMAIN, TAG, 'Resource-built type=%{public}d', event.eventType);
        expect(event.eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
        hilog.info(DOMAIN, TAG, 'Resource-built intensity=%{public}s', String(event.intensity));
        expect(event.intensity).assertEqual(100);
        hilog.info(DOMAIN, TAG, 'Resource-built frequency=%{public}s', String(event.frequency));
        expect(event.frequency).assertEqual(50);
        hilog.info(DOMAIN, TAG, 'Resource-built index=%{public}s', String(event.index));
        expect(event.index).assertEqual(1);
        starts.push(event.time);
        duration += event.duration ?? 0;
        end = Math.max(end, event.time + (event.duration ?? 0));
      }
      starts.sort((left: number, right: number): number => left - right);
      hilog.info(DOMAIN, TAG, 'Resource-built starts=%{public}s', starts.join(','));
      expect(starts.join(',')).assertEqual('0,25');
      hilog.info(DOMAIN, TAG, 'Resource-built total=%{public}d', duration);
      expect(duration).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'Resource-built end=%{public}d', end);
      expect(end).assertEqual(40);
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0005
     * @tc.name testVibratorEntry0005
     * @tc.desc 保留真实资源起点与参数，将第二事件改为短事件，核对48毫秒固定时长与73毫秒结束。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorEntry0005', 0, (): void => {
      const raw: RawPattern = JSON.parse(decodeRaw(entryResources().getRawFileContentSync(RAW_FILE))) as RawPattern;
      const channel: RawChannel = raw.Channels[0];
      const first: RawEvent = channel.Pattern[0].Event;
      const second: RawEvent = channel.Pattern[1].Event;
      const continuous: vibrator.ContinuousParam = {
        intensity: first.Parameters.Intensity,
        frequency: first.Parameters.Frequency,
        index: channel.Parameters.Index
      };
      const transient: vibrator.TransientParam = {
        intensity: second.Parameters.Intensity,
        frequency: second.Parameters.Frequency,
        index: channel.Parameters.Index
      };
      const pattern: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder()
        .addContinuousEvent(first.StartTime, first.Duration, continuous)
        .addTransientEvent(second.StartTime, transient).build();
      const events: vibrator.VibratorEvent[] = pattern.events.slice().sort(
        (left: vibrator.VibratorEvent, right: vibrator.VibratorEvent): number => left.time - right.time);
      hilog.info(DOMAIN, TAG, 'Resource mixed count=%{public}d', events.length);
      expect(events.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'Resource mixed first type=%{public}d', events[0].eventType);
      expect(events[0].eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
      hilog.info(DOMAIN, TAG, 'Resource mixed second type=%{public}d', events[1].eventType);
      expect(events[1].eventType).assertEqual(vibrator.VibratorEventType.TRANSIENT);
      hilog.info(DOMAIN, TAG, 'Resource mixed duration=%{public}s', String(events[1].duration));
      expect(events[1].duration).assertEqual(48);
      const end: number = events[1].time + (events[1].duration ?? 0);
      hilog.info(DOMAIN, TAG, 'Resource mixed end=%{public}d', end);
      expect(end).assertEqual(73);
      const gap: number = events[1].time - events[0].time - (events[0].duration ?? 0);
      hilog.info(DOMAIN, TAG, 'Resource mixed gap=%{public}d', gap);
      expect(gap).assertEqual(10);
    });

    /**
     * @tc.number SUB_VIBRATOR_ENTRY_0006
     * @tc.name testVibratorEntry0006
     * @tc.desc 对实际raw fd按两段偏移读取，拼接后内容与资源接口一致且版本和日期字段可解析。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorEntry0006', 0, (): void => {
      const manager: resourceManager.ResourceManager = entryResources();
      const descriptor: resourceManager.RawFileDescriptor = manager.getRawFdSync(RAW_FILE);
      try {
        const split: number = Math.floor(descriptor.length / 2);
        const first: ArrayBuffer = new ArrayBuffer(split);
        const last: ArrayBuffer = new ArrayBuffer(descriptor.length - split);
        const firstOptions: ReadOptions = { offset: descriptor.offset, length: split };
        const lastOptions: ReadOptions = { offset: descriptor.offset + split, length: descriptor.length - split };
        const firstLength: number = fileIo.readSync(descriptor.fd, first, firstOptions);
        const lastLength: number = fileIo.readSync(descriptor.fd, last, lastOptions);
        hilog.info(DOMAIN, TAG, 'Raw segment first length=%{public}d', firstLength);
        expect(firstLength).assertEqual(split);
        hilog.info(DOMAIN, TAG, 'Raw segment last length=%{public}d', lastLength);
        expect(lastLength).assertEqual(descriptor.length - split);
        const combined: Uint8Array = new Uint8Array(firstLength + lastLength);
        combined.set(new Uint8Array(first, 0, firstLength));
        combined.set(new Uint8Array(last, 0, lastLength), firstLength);
        const actual: string = decodeRaw(combined);
        const expected: string = decodeRaw(manager.getRawFileContentSync(RAW_FILE));
        hilog.info(DOMAIN, TAG, 'Raw combined length=%{public}d', combined.length);
        expect(actual).assertEqual(expected);
        const raw: RawPattern = JSON.parse(actual) as RawPattern;
        hilog.info(DOMAIN, TAG, 'Raw combined version=%{public}d', raw.MetaData.Version);
        expect(raw.MetaData.Version).assertEqual(1);
        hilog.info(DOMAIN, TAG, 'Raw combined create=%{public}s', raw.MetaData.Create);
        expect(raw.MetaData.Create).assertEqual('2023-01-09');
      } finally {
        manager.closeRawFdSync(RAW_FILE);
      }
    });
  });
}
