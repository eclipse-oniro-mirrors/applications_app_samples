/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { dslData } from '../../../main/ets/bridge/ImperativeDynamicLayoutsBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DslRootModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const root: ESObject = dslData;
const topLevel: Array<ESObject> = dslData.children as Array<ESObject>;

export default function dslRootModelCoreTest(): void {
  describe('DslRootModelCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0001
     * @tc.name      testDslRootModel0001
     * @tc.desc      Verify the bridged DSL data source is a defined object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0001 begin');
      const defined: boolean = dslData !== undefined && dslData !== null;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue defined=${defined}`);
      expect(defined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof dslData=${typeof dslData}, expected='object'`);
      expect(typeof dslData).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse Array.isArray(dslData)=${Array.isArray(dslData)}`);
      expect(Array.isArray(dslData)).assertFalse();
      log('testDslRootModel0001 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0002
     * @tc.name      testDslRootModel0002
     * @tc.desc      Verify the root node type is Column.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(root.type)=${String(root.type)}, expected='Column'`);
      expect(String(root.type)).assertEqual('Column');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof root.type=${typeof root.type}, expected='string'`);
      expect(typeof root.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse String(root.type) === 'Row'=${String(root.type) === 'Row'}`);
      expect(String(root.type) === 'Row').assertFalse();
      log('testDslRootModel0002 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0003
     * @tc.name      testDslRootModel0003
     * @tc.desc      Verify the root node css sets a full width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0003 begin');
      const css: ESObject = root.css;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css !== undefined && css !== null}`);
      expect(css !== undefined && css !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css=${typeof css}, expected='object'`);
      expect(typeof css).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(css.width)=${String(css.width)}, expected='100%'`);
      expect(String(css.width)).assertEqual('100%');
      log('testDslRootModel0003 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0004
     * @tc.name      testDslRootModel0004
     * @tc.desc      Verify the root node holds exactly six children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(root.children)=${Array.isArray(root.children)}`);
      expect(Array.isArray(root.children)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual topLevel.length=${topLevel.length}, expected=6`);
      expect(topLevel.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger topLevel.length=${topLevel.length}, expected=0`);
      expect(topLevel.length).assertLarger(0);
      log('testDslRootModel0004 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0005
     * @tc.name      testDslRootModel0005
     * @tc.desc      Verify the root node carries no interaction id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue root.id === undefined=${root.id === undefined}`);
      expect(root.id === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(root.id)=${String(root.id)}, expected='undefined'`);
      expect(String(root.id)).assertEqual('undefined');
      log('testDslRootModel0005 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0006
     * @tc.name      testDslRootModel0006
     * @tc.desc      Verify the root node carries no text content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue root.content === undefined=${root.content === undefined}`);
      expect(root.content === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(root.content)=${String(root.content)}`);
      expect(String(root.content)).assertEqual('undefined');
      log('testDslRootModel0006 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0007
     * @tc.name      testDslRootModel0007
     * @tc.desc      Verify the first top level section is a Row header.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0007 begin');
      const first: ESObject = topLevel[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(first.type)=${String(first.type)}, expected='Row'`);
      expect(String(first.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof first.type=${typeof first.type}, expected='string'`);
      expect(typeof first.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(first.children)}`);
      expect(Array.isArray(first.children)).assertTrue();
      log('testDslRootModel0007 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0008
     * @tc.name      testDslRootModel0008
     * @tc.desc      Verify the second top level section is a Swiper.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0008 begin');
      const second: ESObject = topLevel[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(second.type)=${String(second.type)}`);
      expect(String(second.type)).assertEqual('Swiper');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof second.type=${typeof second.type}, expected='string'`);
      expect(typeof second.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${String(second.type) === 'Image'}`);
      expect(String(second.type) === 'Image').assertFalse();
      log('testDslRootModel0008 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0009
     * @tc.name      testDslRootModel0009
     * @tc.desc      Verify the third top level section is a Row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0009 begin');
      const third: ESObject = topLevel[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(third.type)=${String(third.type)}, expected='Row'`);
      expect(String(third.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof third.type=${typeof third.type}, expected='string'`);
      expect(typeof third.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(third.children)}`);
      expect(Array.isArray(third.children)).assertTrue();
      log('testDslRootModel0009 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0010
     * @tc.name      testDslRootModel0010
     * @tc.desc      Verify the fourth top level section is a Row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0010 begin');
      const fourth: ESObject = topLevel[3];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(fourth.type)=${String(fourth.type)}, expected='Row'`);
      expect(String(fourth.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fourth.type=${typeof fourth.type}, expected='string'`);
      expect(typeof fourth.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(fourth.children)}`);
      expect(Array.isArray(fourth.children)).assertTrue();
      log('testDslRootModel0010 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0011
     * @tc.name      testDslRootModel0011
     * @tc.desc      Verify the fifth top level section is a Row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0011 begin');
      const fifth: ESObject = topLevel[4];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(fifth.type)=${String(fifth.type)}, expected='Row'`);
      expect(String(fifth.type)).assertEqual('Row');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fifth.type=${typeof fifth.type}, expected='string'`);
      expect(typeof fifth.type).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(fifth.children)}`);
      expect(Array.isArray(fifth.children)).assertTrue();
      log('testDslRootModel0011 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0012
     * @tc.name      testDslRootModel0012
     * @tc.desc      Verify the last top level section is the refresh Text leaf.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0012 begin');
      const last: ESObject = topLevel[5];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(last.type)=${String(last.type)}, expected='Text'`);
      expect(String(last.type)).assertEqual('Text');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(last.id)=${String(last.id)}, expected='refreshImage'`);
      expect(String(last.id)).assertEqual('refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse Array.isArray(last.children)=${Array.isArray(last.children)}`);
      expect(Array.isArray(last.children)).assertFalse();
      log('testDslRootModel0012 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0013
     * @tc.name      testDslRootModel0013
     * @tc.desc      Verify only the last top level node owns an interaction id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0013 begin');
      for (let i: number = 0; i < 5; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${topLevel[i].id === undefined}`);
        expect(topLevel[i].id === undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(topLevel[5].id)=${String(topLevel[5].id)}`);
      expect(String(topLevel[5].id)).assertEqual('refreshImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue topLevel[5].id !== undefined=${topLevel[5].id !== undefined}`);
      expect(topLevel[5].id !== undefined).assertTrue();
      log('testDslRootModel0013 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0014
     * @tc.name      testDslRootModel0014
     * @tc.desc      Verify every top level section carries a css object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0014 begin');
      for (let i: number = 0; i < topLevel.length; i++) {
        const css: ESObject = topLevel[i].css;
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css !== undefined && css !== null}`);
        expect(css !== undefined && css !== null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css=${typeof css}, expected='object'`);
        expect(typeof css).assertEqual('object');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual topLevel.length=${topLevel.length}, expected=6`);
      expect(topLevel.length).assertEqual(6);
      log('testDslRootModel0014 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLROOT_0015
     * @tc.name      testDslRootModel0015
     * @tc.desc      Verify the six top level sections are distinct nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslRootModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslRootModel0015 begin');
      for (let i: number = 0; i < topLevel.length; i++) {
        for (let j: number = i + 1; j < topLevel.length; j++) {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${topLevel[i] !== topLevel[j]}`);
          expect(topLevel[i] !== topLevel[j]).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue topLevel[0] !== topLevel[5]=${topLevel[0] !== topLevel[5]}`);
      expect(topLevel[0] !== topLevel[5]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual topLevel.length=${topLevel.length}, expected=6`);
      expect(topLevel.length).assertEqual(6);
      log('testDslRootModel0015 end');
    })
  })
}
