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
import { formBindingData } from '@kit.FormKit';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventCollector, logBegin, logEnd, logPair, sleep } from '../util/TestHelper';

const SUBSCRIBE_DELAY: number = 300;

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
 * Verifies the widget binding data and the widget click to common event conversion.
 */
export default function formServiceCoreTest() {
  describe('FormServiceCoreTest', () => {
    /**
     * @tc.number    SUB_CCER_FORM_0001
     * @tc.name      testBindingDataZero0001
     * @tc.desc      初始卡片绑定数据携带发布次数 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBindingDataZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBindingDataZero0001';
      logBegin(caseName);
      const bindingData: formBindingData.FormBindingData = FormEventService.createBindingData(0);
      const json: string = JSON.stringify(bindingData);
      const payload: string = String(bindingData.data);
      logPair(caseName, 'bindingData', payload, '{"publishCount":0}');
      expect(json).assertContain(CommonEventConstants.FORM_COUNT_KEY);
      expect(payload).assertContain('"publishCount":0');
      logPair(caseName, 'hasData', (bindingData.data !== undefined).toString(), 'true');
      expect(bindingData.data !== undefined).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0002
     * @tc.name      testBindingDataCount0002
     * @tc.desc      卡片绑定数据按传入次数更新
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBindingDataCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBindingDataCount0002';
      logBegin(caseName);
      const bindingData: formBindingData.FormBindingData = FormEventService.createBindingData(3);
      const json: string = JSON.stringify(bindingData);
      const payload: string = String(bindingData.data);
      logPair(caseName, 'bindingData', payload, '{"publishCount":3}');
      expect(payload).assertContain('"publishCount":3');
      expect(json).assertContain(CommonEventConstants.FORM_COUNT_KEY);
      expect(bindingData.data !== undefined).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0003
     * @tc.name      testBindingDataLargeCount0003
     * @tc.desc      较大的发布次数同样写入卡片绑定数据
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBindingDataLargeCount0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBindingDataLargeCount0003';
      logBegin(caseName);
      const bindingData: formBindingData.FormBindingData = FormEventService.createBindingData(2048);
      const payload: string = String(bindingData.data);
      logPair(caseName, 'bindingData', payload, '{"publishCount":2048}');
      expect(payload).assertContain('"publishCount":2048');
      const parsed: Record<string, number> = JSON.parse(payload) as Record<string, number>;
      logPair(caseName, 'parsed.publishCount', parsed.publishCount.toString(), '2048');
      expect(parsed.publishCount).assertEqual(2048);
      logPair(caseName, 'parsedKeyCount', Object.keys(parsed).length.toString(), '1');
      expect(Object.keys(parsed).length).assertEqual(1);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0004
     * @tc.name      testBindingDataNegativeCount0004
     * @tc.desc      负值发布次数原样写入卡片绑定数据，便于暴露异常计数
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testBindingDataNegativeCount0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBindingDataNegativeCount0004';
      logBegin(caseName);
      const bindingData: formBindingData.FormBindingData = FormEventService.createBindingData(-1);
      const json: string = JSON.stringify(bindingData);
      const payload: string = String(bindingData.data);
      logPair(caseName, 'bindingData', payload, '{"publishCount":-1}');
      expect(payload).assertContain('"publishCount":-1');
      expect(json).assertContain(CommonEventConstants.FORM_COUNT_KEY);
      expect(bindingData.data !== undefined).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0005
     * @tc.name      testParseEmptyMessage0005
     * @tc.desc      空消息解析为默认事件数据 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseEmptyMessage0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseEmptyMessage0005';
      logBegin(caseName);
      const data: string = FormEventService.parseEventData(CommonEventConstants.EMPTY_VALUE);
      logPair(caseName, 'parseEventData(empty)', data, CommonEventConstants.DATA_OUT_APP);
      expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      expect(data.length > 0).assertTrue();
      expect(data === CommonEventConstants.DATA_IN_APP).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0006
     * @tc.name      testParseEmptyObject0006
     * @tc.desc      空 JSON 对象解析为默认事件数据 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseEmptyObject0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseEmptyObject0006';
      logBegin(caseName);
      const data: string = FormEventService.parseEventData('{}');
      logPair(caseName, 'parseEventData({})', data, CommonEventConstants.DATA_OUT_APP);
      expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const onlyMessage: string = FormEventService.parseEventData('{"message":"click"}');
      logPair(caseName, 'parseEventData(message only)', onlyMessage, CommonEventConstants.DATA_OUT_APP);
      expect(onlyMessage).assertEqual(CommonEventConstants.DATA_OUT_APP);
      expect(data.length > 0).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0007
     * @tc.name      testParseInAppMessage0007
     * @tc.desc      卡片消息中的 InApp 数据被原样解析
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseInAppMessage0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseInAppMessage0007';
      logBegin(caseName);
      const data: string = FormEventService.parseEventData('{"data":"InApp"}');
      logPair(caseName, 'parseEventData(InApp)', data, CommonEventConstants.DATA_IN_APP);
      expect(data).assertEqual(CommonEventConstants.DATA_IN_APP);
      expect(data === CommonEventConstants.DATA_OUT_APP).assertFalse();
      expect(data.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0008
     * @tc.name      testParseEmptyDataValue0008
     * @tc.desc      卡片消息中数据为空串时回退为 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseEmptyDataValue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseEmptyDataValue0008';
      logBegin(caseName);
      const data: string = FormEventService.parseEventData('{"data":""}');
      logPair(caseName, 'parseEventData(empty data)', data, CommonEventConstants.DATA_OUT_APP);
      expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      expect(data.length > 0).assertTrue();
      expect(data === CommonEventConstants.DATA_IN_APP).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0009
     * @tc.name      testParseInvalidMessage0009
     * @tc.desc      非 JSON 消息解析失败时回退为 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseInvalidMessage0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseInvalidMessage0009';
      logBegin(caseName);
      const invalidValues: string[] = ['click', '{data:InApp}', '{"data":', 'null'];
      for (let index: number = 0; index < invalidValues.length; index++) {
        const data: string = FormEventService.parseEventData(invalidValues[index]);
        logPair(caseName, `parseEventData(${invalidValues[index]})`, data, CommonEventConstants.DATA_OUT_APP);
        expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      }
      expect(FormEventService.parseEventData('{"data"')).assertEqual(CommonEventConstants.DATA_OUT_APP);
      expect(FormEventService.parseEventData('{"data":"')).assertEqual(CommonEventConstants.DATA_OUT_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0010
     * @tc.name      testParseCustomData0010
     * @tc.desc      卡片消息中的自定义数据与多余字段不影响数据解析
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseCustomData0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseCustomData0010';
      logBegin(caseName);
      const data: string = FormEventService.parseEventData('{"message":"click","data":"Custom_Value","code":1}');
      logPair(caseName, 'parseEventData(custom)', data, 'Custom_Value');
      expect(data).assertEqual('Custom_Value');
      const padded: string = FormEventService.parseEventData('  {"data":"InApp"}  ');
      logPair(caseName, 'parseEventData(padded)', padded, CommonEventConstants.DATA_IN_APP);
      expect(padded).assertEqual(CommonEventConstants.DATA_IN_APP);
      expect(data === CommonEventConstants.DATA_OUT_APP).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0011
     * @tc.name      testParseJsonPrimitive0011
     * @tc.desc      JSON 基本类型消息不包含数据字段时回退为 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseJsonPrimitive0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseJsonPrimitive0011';
      logBegin(caseName);
      const primitives: string[] = ['123', '"InApp"', 'true', '[]'];
      for (let index: number = 0; index < primitives.length; index++) {
        const data: string = FormEventService.parseEventData(primitives[index]);
        logPair(caseName, `parseEventData(${primitives[index]})`, data, CommonEventConstants.DATA_OUT_APP);
        expect(data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      }
      expect(FormEventService.parseEventData('[1,2,3]')).assertEqual(CommonEventConstants.DATA_OUT_APP);
      expect(FormEventService.parseEventData('"OutApp"')).assertEqual(CommonEventConstants.DATA_OUT_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0012
     * @tc.name      testPublishFromFormDefault0012
     * @tc.desc      空消息触发卡片发布时发送 OutApp 且来源码为卡片
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishFromFormDefault0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishFromFormDefault0012';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await FormEventService.publishFromForm(CommonEventConstants.EMPTY_VALUE);
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
     * @tc.number    SUB_CCER_FORM_0013
     * @tc.name      testPublishFromFormData0013
     * @tc.desc      卡片消息携带的数据被发布为对应事件数据
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishFromFormData0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishFromFormData0013';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await FormEventService.publishFromForm('{"data":"InApp"}');
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_IN_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
        logPair(caseName, 'code', (event?.code ?? 0).toString(), EventSource.FORM.toString());
        expect(event?.code).assertEqual(EventSource.FORM);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0014
     * @tc.name      testPublishFromFormInvalid0014
     * @tc.desc      非法卡片消息触发发布时仍发送 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishFromFormInvalid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishFromFormInvalid0014';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await FormEventService.publishFromForm('click');
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'received', received.toString(), 'true');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'eventName', event?.event ?? '', CommonEventConstants.EVENT_NAME);
        expect(event?.event).assertEqual(CommonEventConstants.EVENT_NAME);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0015
     * @tc.name      testPublishFromFormTwice0015
     * @tc.desc      卡片连续点击两次时两次事件都被发布
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishFromFormTwice0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishFromFormTwice0015';
      logBegin(caseName);
      await withCollector(async (collector: EventCollector) => {
        await FormEventService.publishFromForm('{"data":"OutApp"}');
        await FormEventService.publishFromForm('{"data":"InApp"}');
        const received: boolean = await collector.waitForCount(2);
        logPair(caseName, 'receivedCount', collector.getCount().toString(), '>=2');
        expect(received).assertTrue();
        const first: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        const second: commonEventManager.CommonEventData | null = collector.getEventAt(1);
        logPair(caseName, 'firstData', first?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(first?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'secondData', second?.data ?? '', CommonEventConstants.DATA_IN_APP);
        expect(second?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      });
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_FORM_0016
     * @tc.name      testParseResultIsOutAppOrValue0016
     * @tc.desc      解析结果始终为消息中的数据或默认的 OutApp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testParseResultIsOutAppOrValue0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testParseResultIsOutAppOrValue0016';
      logBegin(caseName);
      const messages: string[] = ['{"data":"OutApp"}', '{"data":"InApp"}', '{"data":"Value_1"}', '', '{}', 'invalid'];
      for (let index: number = 0; index < messages.length; index++) {
        const data: string = FormEventService.parseEventData(messages[index]);
        const valid: boolean = data.length > 0 && data === data.trim();
        logPair(caseName, `result(${messages[index]})`, data, 'OutApp or trimmed value');
        expect(valid).assertTrue();
      }
      const paddedValue: string = FormEventService.parseEventData('{"data":"  Value  "}');
      expect(paddedValue).assertContain('Value');
      expect(paddedValue === paddedValue.trim()).assertFalse();
      logEnd(caseName);
    })
  })
}
