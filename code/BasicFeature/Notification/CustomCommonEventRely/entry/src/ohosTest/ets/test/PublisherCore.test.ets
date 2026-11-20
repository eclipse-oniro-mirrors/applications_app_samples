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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { commonEventManager } from '@kit.BasicServicesKit';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventCollector, logBegin, logEnd, logPair, sleep } from '../util/TestHelper';

const SUBSCRIBE_DELAY: number = 300;

/**
 * Builds a string with the given length to verify the data length limit.
 */
function buildData(length: number): string {
  let parts: string[] = [];
  for (let index: number = 0; index < length; index++) {
    parts.push('a');
  }
  return parts.join('');
}

/**
 * Starts a collector, runs the given action and stops the collector afterwards.
 */
async function withCollector(action: (collector: EventCollector) => Promise<void>): Promise<void> {
  let collector: EventCollector = new EventCollector();
  await collector.start();
  await sleep(SUBSCRIBE_DELAY);
  try {
    await action(collector);
  } finally {
    await collector.stop();
  }
}

/**
 * Verifies the publish data of the custom common event and the real delivery of published events.
 */
export default function publisherCoreTest() {
  describe('PublisherCoreTest', () => {
    /**
     * @tc.number    SUB_CCER_PUBLISH_0001
     * @tc.name      testBuildPublishData0001
     * @tc.desc      默认构建的发布数据携带事件数据与来源码且不是有序事件
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBuildPublishData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuildPublishData0001';
      logBegin(caseName);
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
      logPair(caseName, 'data', publishData.data ?? '', CommonEventConstants.DATA_OUT_APP);
      expect(publishData.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      logPair(caseName, 'code', (publishData.code ?? 0).toString(), EventSource.PAGE.toString());
      expect(publishData.code).assertEqual(EventSource.PAGE);
      logPair(caseName, 'isOrdered', (publishData.isOrdered ?? false).toString(), 'false');
      expect(publishData.isOrdered).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0002
     * @tc.name      testBuildOrderedPublishData0002
     * @tc.desc      显式指定有序事件时发布数据携带有序标记
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBuildOrderedPublishData0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuildOrderedPublishData0002';
      logBegin(caseName);
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_IN_APP, EventSource.FORM, true);
      logPair(caseName, 'isOrdered', (publishData.isOrdered ?? false).toString(), 'true');
      expect(publishData.isOrdered).assertTrue();
      logPair(caseName, 'code', (publishData.code ?? 0).toString(), EventSource.FORM.toString());
      expect(publishData.code).assertEqual(EventSource.FORM);
      expect(publishData.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0003
     * @tc.name      testSupportedData0003
     * @tc.desc      宿主约定的 InApp 与 OutApp 均被识别为受支持的事件数据
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testSupportedData0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSupportedData0003';
      logBegin(caseName);
      logPair(caseName, 'InApp', CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_IN_APP).toString(),
        'true');
      expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_IN_APP)).assertTrue();
      logPair(caseName, 'OutApp', CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP).toString(),
        'true');
      expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP)).assertTrue();
      expect(CommonEventPublisher.isSupportedData('OutAppx')).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0004
     * @tc.name      testUnsupportedData0004
     * @tc.desc      空串、大小写不一致与自定义数据均不被识别为受支持的事件数据
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testUnsupportedData0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testUnsupportedData0004';
      logBegin(caseName);
      const values: string[] = ['', 'outapp', 'inapp', 'INAPP', 'Unknown', 'OutApp '];
      for (let index: number = 0; index < values.length; index++) {
        const supported: boolean = CommonEventPublisher.isSupportedData(values[index]);
        logPair(caseName, `isSupportedData(${values[index]})`, supported.toString(), 'false');
        expect(supported).assertFalse();
      }
      expect(CommonEventPublisher.isSupportedData(values[0])).assertFalse();
      expect(CommonEventPublisher.isSupportedData('InApp ')).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0005
     * @tc.name      testDataLengthBoundary0005
     * @tc.desc      数据长度等于 64 KB 上限时校验通过
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testDataLengthBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testDataLengthBoundary0005';
      logBegin(caseName);
      const boundary: string = buildData(CommonEventConstants.MAX_EVENT_DATA_LENGTH);
      logPair(caseName, 'length', boundary.length.toString(),
        CommonEventConstants.MAX_EVENT_DATA_LENGTH.toString());
      expect(boundary.length).assertEqual(CommonEventConstants.MAX_EVENT_DATA_LENGTH);
      logPair(caseName, 'isDataLengthValid', CommonEventPublisher.isDataLengthValid(boundary).toString(), 'true');
      expect(CommonEventPublisher.isDataLengthValid(boundary)).assertTrue();
      logPair(caseName, 'isDataLengthValid(empty)', CommonEventPublisher.isDataLengthValid('').toString(), 'true');
      expect(CommonEventPublisher.isDataLengthValid('')).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0006
     * @tc.name      testDataTooLong0006
     * @tc.desc      数据长度超过 64 KB 上限时校验不通过
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testDataTooLong0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testDataTooLong0006';
      logBegin(caseName);
      const tooLong: string = buildData(CommonEventConstants.MAX_EVENT_DATA_LENGTH + 1);
      logPair(caseName, 'length', tooLong.length.toString(),
        (CommonEventConstants.MAX_EVENT_DATA_LENGTH + 1).toString());
      expect(tooLong.length).assertEqual(CommonEventConstants.MAX_EVENT_DATA_LENGTH + 1);
      logPair(caseName, 'isDataLengthValid', CommonEventPublisher.isDataLengthValid(tooLong).toString(), 'false');
      expect(CommonEventPublisher.isDataLengthValid(tooLong)).assertFalse();
      expect(
        CommonEventPublisher.isDataLengthValid(buildData(CommonEventConstants.MAX_EVENT_DATA_LENGTH))).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0007
     * @tc.name      testEmptyEventNameRejected0007
     * @tc.desc      事件名为空时发布操作被拒绝
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEmptyEventNameRejected0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEmptyEventNameRejected0007';
      logBegin(caseName);
      let rejected: boolean = false;
      try {
        await CommonEventPublisher.publishWithOptions(CommonEventConstants.EMPTY_VALUE,
          CommonEventPublisher.buildPublishData(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE));
      } catch (error) {
        rejected = true;
      }
      logPair(caseName, 'rejected', rejected.toString(), 'true');
      expect(rejected).assertTrue();
      expect(CommonEventPublisher.isDataLengthValid(CommonEventConstants.EMPTY_VALUE)).assertTrue();
      const emptyPublishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData(CommonEventConstants.EMPTY_VALUE, EventSource.UNKNOWN);
      expect(emptyPublishData.data ?? '').assertEqual(CommonEventConstants.EMPTY_VALUE);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0008
     * @tc.name      testPublishPageEvent0008
     * @tc.desc      页面来源发布的事件被订阅者收到且携带 OutApp 与页面来源码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishPageEvent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishPageEvent0008';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'eventName', event?.event ?? '', CommonEventConstants.EVENT_NAME);
        expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.PAGE.toString());
        expect(event?.code).assertEqual(EventSource.PAGE);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0009
     * @tc.name      testPublishFormEvent0009
     * @tc.desc      卡片来源发布的事件被订阅者收到且携带卡片来源码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishFormEvent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishFormEvent0009';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.FORM);
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
        expect(event?.code).assertEqual(EventSource.FORM);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0010
     * @tc.name      testPublishExternalEvent0010
     * @tc.desc      外部来源发布的事件被订阅者收到且来源码为未知
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishExternalEvent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishExternalEvent0010';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_IN_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
        logPair(caseName, 'code', (event?.code ?? -1).toString(), EventSource.UNKNOWN.toString());
        expect(event?.code).assertEqual(EventSource.UNKNOWN);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0011
     * @tc.name      testPublishOrderedEvent0011
     * @tc.desc      以有序方式发布的事件仍被订阅者正确收到
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishOrderedEvent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishOrderedEvent0011';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.FORM, true);
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
        expect(event?.code).assertEqual(EventSource.FORM);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0012
     * @tc.name      testPublishTwiceInOrder0012
     * @tc.desc      连续发布两次时订阅者按发布顺序收到两个事件
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishTwiceInOrder0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishTwiceInOrder0012';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
        await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
        const received: boolean = await collector.waitForCount(2);
        logPair(caseName, 'receivedCount', collector.getCount().toString(), '>=2');
        expect(received).assertTrue();
        const first: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        const second: commonEventManager.CommonEventData | null = collector.getEventAt(1);
        logPair(caseName, 'firstData', first?.data ?? '', CommonEventConstants.DATA_IN_APP);
        expect(first?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
        logPair(caseName, 'secondData', second?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(second?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'secondCode', (second?.code ?? 0).toString(), EventSource.PAGE.toString());
        expect(second?.code).assertEqual(EventSource.PAGE);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0013
     * @tc.name      testPublishMultipleEvents0013
     * @tc.desc      连续发布五次时订阅者收到全部事件
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishMultipleEvents0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishMultipleEvents0013';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        for (let index: number = 0; index < 5; index++) {
          await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
        }
        const received: boolean = await collector.waitForCount(5);
        logPair(caseName, 'receivedCount', collector.getCount().toString(), '5');
        expect(received).assertTrue();
        expect(collector.getCount()).assertEqual(5);
        let allOutApp: boolean = true;
        for (let index: number = 0; index < collector.getCount(); index++) {
          const event: commonEventManager.CommonEventData | null = collector.getEventAt(index);
          if (event === null || event.data !== CommonEventConstants.DATA_OUT_APP) {
            allOutApp = false;
          }
        }
        logPair(caseName, 'allOutApp', allOutApp.toString(), 'true');
        expect(allOutApp).assertTrue();
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_PUBLISH_0014
     * @tc.name      testPublishKeepsEventName0014
     * @tc.desc      发布后订阅者收到的事件名始终是示例约定的自定义事件
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishKeepsEventName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishKeepsEventName0014';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.FORM);
        await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
        const received: boolean = await collector.waitForCount(2);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        for (let index: number = 0; index < collector.getCount(); index++) {
          const event: commonEventManager.CommonEventData | null = collector.getEventAt(index);
          logPair(caseName, `event[${index}]`, event?.event ?? '', CommonEventConstants.EVENT_NAME);
          expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
        }
        expect(collector.getCount() >= 2).assertTrue();
      });
      logEnd(caseName);
    })
  })
}
