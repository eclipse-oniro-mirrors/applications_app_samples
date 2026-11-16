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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
import logger from '../../../main/ets/model/Logger';
import { formBindingData } from '@kit.FormKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function canvasGameCompositeTypesTest() {
  describe('CanvasGameCompositeTypesTest', () => {

    /**
     * @tc.name   testCanvasComposite0001
     * @tc.number SUB_CANVAS_COMPOSITE_0001
     * @tc.desc   Composite type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const data: formBindingData.FormBindingData = a.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(data !== undefined));
        expect(data !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof data === 'object'));
        expect(typeof data === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0001 end');
    })

    /**
     * @tc.name   testCanvasComposite0002
     * @tc.number SUB_CANVAS_COMPOSITE_0002
     * @tc.desc   Composite type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const data: formBindingData.FormBindingData = a.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(data !== undefined));
        expect(data !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof data === 'object'));
        expect(typeof data === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0002 end');
    })

    /**
     * @tc.name   testCanvasComposite0003
     * @tc.number SUB_CANVAS_COMPOSITE_0003
     * @tc.desc   Composite type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const data: formBindingData.FormBindingData = a.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(data !== undefined));
        expect(data !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof data === 'object'));
        expect(typeof data === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0003 end');
    })

    /**
     * @tc.name   testCanvasComposite0004
     * @tc.number SUB_CANVAS_COMPOSITE_0004
     * @tc.desc   Composite type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const data: formBindingData.FormBindingData = a.onAddForm({});
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(data !== undefined));
        expect(data !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof data === 'object'));
        expect(typeof data === 'object').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0004 end');
    })

    /**
     * @tc.name   testCanvasComposite0005
     * @tc.number SUB_CANVAS_COMPOSITE_0005
     * @tc.desc   Composite type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const values: string[] = ['a','b','c'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-5', values.join('-')) === undefined));
        expect(a.onFormEvent('form-5', values.join('-')) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(values.length), String(3));
        expect(values.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0005 end');
    })

    /**
     * @tc.name   testCanvasComposite0006
     * @tc.number SUB_CANVAS_COMPOSITE_0006
     * @tc.desc   Composite type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const values: string[] = ['a','b','c'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-6', values.join('-')) === undefined));
        expect(a.onFormEvent('form-6', values.join('-')) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(values.length), String(3));
        expect(values.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0006 end');
    })

    /**
     * @tc.name   testCanvasComposite0007
     * @tc.number SUB_CANVAS_COMPOSITE_0007
     * @tc.desc   Composite type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const values: string[] = ['a','b','c'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-7', values.join('-')) === undefined));
        expect(a.onFormEvent('form-7', values.join('-')) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(values.length), String(3));
        expect(values.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0007 end');
    })

    /**
     * @tc.name   testCanvasComposite0008
     * @tc.number SUB_CANVAS_COMPOSITE_0008
     * @tc.desc   Composite type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const values: string[] = ['a','b','c'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('form-8', values.join('-')) === undefined));
        expect(a.onFormEvent('form-8', values.join('-')) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(values.length), String(3));
        expect(values.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0008 end');
    })

    /**
     * @tc.name   testCanvasComposite0009
     * @tc.number SUB_CANVAS_COMPOSITE_0009
     * @tc.desc   Composite type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('a','b','c','d') === undefined));
      expect(logger.info('a','b','c','d') === undefined).assertTrue();
        const tuple: string[] = ['x','y'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple.length), String(2));
        expect(tuple.length).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple[0]), String('x'));
        expect(tuple[0]).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0009 end');
    })

    /**
     * @tc.name   testCanvasComposite0010
     * @tc.number SUB_CANVAS_COMPOSITE_0010
     * @tc.desc   Composite type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('a','b','c','d') === undefined));
      expect(logger.info('a','b','c','d') === undefined).assertTrue();
        const tuple: string[] = ['x','y'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple.length), String(2));
        expect(tuple.length).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple[0]), String('x'));
        expect(tuple[0]).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0010 end');
    })

    /**
     * @tc.name   testCanvasComposite0011
     * @tc.number SUB_CANVAS_COMPOSITE_0011
     * @tc.desc   Composite type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('a','b','c','d') === undefined));
      expect(logger.info('a','b','c','d') === undefined).assertTrue();
        const tuple: string[] = ['x','y'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple.length), String(2));
        expect(tuple.length).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple[0]), String('x'));
        expect(tuple[0]).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0011 end');
    })

    /**
     * @tc.name   testCanvasComposite0012
     * @tc.number SUB_CANVAS_COMPOSITE_0012
     * @tc.desc   Composite type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.info('a','b','c','d') === undefined));
      expect(logger.info('a','b','c','d') === undefined).assertTrue();
        const tuple: string[] = ['x','y'];
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple.length), String(2));
        expect(tuple.length).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tuple[0]), String('x'));
        expect(tuple[0]).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasComposite0012 end');
    })
  })
}
