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
const TAG: string = 'DslDatasetIntegrityTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function collectAll(node: ESObject, acc: Array<ESObject>): void {
  acc.push(node);
  const kids: ESObject = node.children;
  if (Array.isArray(kids)) {
    const arr: Array<ESObject> = kids as Array<ESObject>;
    for (let i: number = 0; i < arr.length; i++) {
      collectAll(arr[i], acc);
    }
  }
}

function maxDepth(node: ESObject): number {
  const kids: ESObject = node.children;
  if (!Array.isArray(kids) || (kids as Array<ESObject>).length === 0) {
    return 1;
  }
  let deepest: number = 0;
  const arr: Array<ESObject> = kids as Array<ESObject>;
  for (let i: number = 0; i < arr.length; i++) {
    const depth: number = maxDepth(arr[i]);
    if (depth > deepest) {
      deepest = depth;
    }
  }
  return deepest + 1;
}

function countType(all: Array<ESObject>, typeName: string): number {
  let total: number = 0;
  for (let i: number = 0; i < all.length; i++) {
    if (String(all[i].type) === typeName) {
      total++;
    }
  }
  return total;
}

const root: ESObject = dslData;
const allNodes: Array<ESObject> = [];
collectAll(root, allNodes);

const textItems: string[] = [];
const imageItems: string[] = [];
for (let i: number = 0; i < allNodes.length; i++) {
  const node: ESObject = allNodes[i];
  if (String(node.type) === 'Text' && node.content !== undefined) {
    textItems.push(String(node.content));
  }
  if (String(node.type) === 'Image' && node.content !== undefined) {
    imageItems.push(String(node.content));
  }
}

export default function dslDatasetIntegrityTest(): void {
  describe('DslDatasetIntegrityTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0701
     * @tc.name      testDslDataset0701
     * @tc.desc      Verify the DSL tree holds exactly twenty-four nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0701 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allNodes.length=${allNodes.length}, expected=24`);
      expect(allNodes.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger allNodes.length=${allNodes.length}, expected=0`);
      expect(allNodes.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNodes[0] === root=${allNodes[0] === root}`);
      expect(allNodes[0] === root).assertTrue();
      log('testDslDataset0701 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0702
     * @tc.name      testDslDataset0702
     * @tc.desc      Verify the tree contains three Column nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0702 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${countType(allNodes, 'Column')}, expected=3`);
      expect(countType(allNodes, 'Column')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${countType(allNodes, 'Column')}, expected=0`);
      expect(countType(allNodes, 'Column')).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(root.type)=${String(root.type)}, expected='Column'`);
      expect(String(root.type)).assertEqual('Column');
      log('testDslDataset0702 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0703
     * @tc.name      testDslDataset0703
     * @tc.desc      Verify the tree contains four Row nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0703 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Row')=${countType(allNodes, 'Row')}`);
      expect(countType(allNodes, 'Row')).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger countType(allNodes, 'Row')=${countType(allNodes, 'Row')}`);
      expect(countType(allNodes, 'Row')).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger countType(allNodes, 'Row')=${countType(allNodes, 'Row')}`);
      expect(countType(allNodes, 'Row')).assertLarger(countType(allNodes, 'Column'));
      log('testDslDataset0703 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0704
     * @tc.name      testDslDataset0704
     * @tc.desc      Verify the tree contains a single Swiper node.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0704 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${countType(allNodes, 'Swiper')}, expected=1`);
      expect(countType(allNodes, 'Swiper')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${countType(allNodes, 'Swiper')}, expected=0`);
      expect(countType(allNodes, 'Swiper')).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${countType(allNodes, 'Swiper')}`);
      expect(countType(allNodes, 'Swiper')).assertLess(countType(allNodes, 'Row'));
      log('testDslDataset0704 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0705
     * @tc.name      testDslDataset0705
     * @tc.desc      Verify the tree contains six Image nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0705 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Image')=${countType(allNodes, 'Image')}`);
      expect(countType(allNodes, 'Image')).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual imageItems.length=${imageItems.length}, expected=6`);
      expect(imageItems.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Image')=${countType(allNodes, 'Image')}`);
      expect(countType(allNodes, 'Image')).assertEqual(imageItems.length);
      log('testDslDataset0705 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0706
     * @tc.name      testDslDataset0706
     * @tc.desc      Verify the tree contains ten Text nodes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0706 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Text')=${countType(allNodes, 'Text')}`);
      expect(countType(allNodes, 'Text')).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual textItems.length=${textItems.length}, expected=10`);
      expect(textItems.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger countType(allNodes, 'Text')=${countType(allNodes, 'Text')}`);
      expect(countType(allNodes, 'Text')).assertLarger(countType(allNodes, 'Image'));
      log('testDslDataset0706 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0707
     * @tc.name      testDslDataset0707
     * @tc.desc      Verify every node type is a supported layout kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0707 begin');
      const supported: string[] = ['Column', 'Row', 'Swiper', 'Image', 'Text'];
      for (let i: number = 0; i < allNodes.length; i++) {
        const typeName: string = String(allNodes[i].type);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${supported.indexOf(typeName) >= 0}`);
        expect(supported.indexOf(typeName) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual supported.length=${supported.length}, expected=5`);
      expect(supported.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allNodes.length=${allNodes.length}, expected=24`);
      expect(allNodes.length).assertEqual(24);
      log('testDslDataset0707 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0708
     * @tc.name      testDslDataset0708
     * @tc.desc      Verify refreshImage is the single tree wide id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0708 begin');
      let idCount: number = 0;
      let refreshCount: number = 0;
      for (let i: number = 0; i < allNodes.length; i++) {
        const nodeId: ESObject = allNodes[i].id;
        if (nodeId !== undefined && nodeId !== null && String(nodeId).length > 0) {
          idCount++;
          if (String(nodeId) === 'refreshImage') {
            refreshCount++;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual idCount=${idCount}, expected=1`);
      expect(idCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual refreshCount=${refreshCount}, expected=1`);
      expect(refreshCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual idCount=${idCount}, expected=refreshCount`);
      expect(idCount).assertEqual(refreshCount);
      log('testDslDataset0708 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0709
     * @tc.name      testDslDataset0709
     * @tc.desc      Verify every node carries a css object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0709 begin');
      for (let i: number = 0; i < allNodes.length; i++) {
        const css: ESObject = allNodes[i].css;
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${css !== undefined && css !== null}`);
        expect(css !== undefined && css !== null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof css=${typeof css}, expected='object'`);
        expect(typeof css).assertEqual('object');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allNodes.length=${allNodes.length}, expected=24`);
      expect(allNodes.length).assertEqual(24);
      log('testDslDataset0709 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0710
     * @tc.name      testDslDataset0710
     * @tc.desc      Verify every image references an app media resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0710 begin');
      for (let i: number = 0; i < imageItems.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${imageItems[i].startsWith('app.media.')}`);
        expect(imageItems[i].startsWith('app.media.')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger imageItems[i].length=${imageItems[i].length}`);
        expect(imageItems[i].length).assertLarger('app.media.'.length);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual imageItems.length=${imageItems.length}, expected=6`);
      expect(imageItems.length).assertEqual(6);
      log('testDslDataset0710 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0711
     * @tc.name      testDslDataset0711
     * @tc.desc      Verify the image resource set is search plus five movies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0711 begin');
      const expected: string[] = [
        'app.media.search',
        'app.media.movie1',
        'app.media.movie2',
        'app.media.movie3',
        'app.media.movie4',
        'app.media.movie5'
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual imageItems.length=${imageItems.length}`);
      expect(imageItems.length).assertEqual(expected.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual expected.length=${expected.length}, expected=6`);
      expect(expected.length).assertEqual(6);
      for (let i: number = 0; i < expected.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${imageItems.indexOf(expected[i]) >= 0}`);
        expect(imageItems.indexOf(expected[i]) >= 0).assertTrue();
      }
      log('testDslDataset0711 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0712
     * @tc.name      testDslDataset0712
     * @tc.desc      Verify every text node has a non empty label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0712 begin');
      for (let i: number = 0; i < textItems.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger textItems[i].length=${textItems[i].length}, expected=0`);
        expect(textItems[i].length).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof textItems[i]=${typeof textItems[i]}`);
        expect(typeof textItems[i]).assertEqual('string');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual textItems.length=${textItems.length}, expected=10`);
      expect(textItems.length).assertEqual(10);
      log('testDslDataset0712 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0713
     * @tc.name      testDslDataset0713
     * @tc.desc      Verify the text label set matches all page captions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0713 begin');
      const expected: string[] = ['首页', '精选', '电视剧', '电影', '综艺', '每日推荐', '更多', '电影1', '电影2', '刷新'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual textItems.length=${textItems.length}`);
      expect(textItems.length).assertEqual(expected.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual expected.length=${expected.length}, expected=10`);
      expect(expected.length).assertEqual(10);
      for (let i: number = 0; i < expected.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${textItems.indexOf(expected[i]) >= 0}`);
        expect(textItems.indexOf(expected[i]) >= 0).assertTrue();
      }
      log('testDslDataset0713 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0714
     * @tc.name      testDslDataset0714
     * @tc.desc      Verify every container node has non empty children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0714 begin');
      for (let i: number = 0; i < allNodes.length; i++) {
        const node: ESObject = allNodes[i];
        const typeName: string = String(node.type);
        if (typeName === 'Column' || typeName === 'Row' || typeName === 'Swiper') {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Array.isArray(node.children)}`);
          expect(Array.isArray(node.children)).assertTrue();
          hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${(node.children as Array<ESObject>).length}`);
          expect((node.children as Array<ESObject>).length).assertLarger(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allNodes.length=${allNodes.length}, expected=24`);
      expect(allNodes.length).assertEqual(24);
      log('testDslDataset0714 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0715
     * @tc.name      testDslDataset0715
     * @tc.desc      Verify image and text leaves define no children.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0715 begin');
      for (let i: number = 0; i < allNodes.length; i++) {
        const node: ESObject = allNodes[i];
        const typeName: string = String(node.type);
        if (typeName === 'Image' || typeName === 'Text') {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${node.children === undefined}`);
          expect(node.children === undefined).assertTrue();
          hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${Array.isArray(node.children)}`);
          expect(Array.isArray(node.children)).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Image')=${countType(allNodes, 'Image')}`);
      expect(countType(allNodes, 'Image')).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual countType(allNodes, 'Text')=${countType(allNodes, 'Text')}`);
      expect(countType(allNodes, 'Text')).assertEqual(10);
      log('testDslDataset0715 end');
    })

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DSLDATA_0716
     * @tc.name      testDslDataset0716
     * @tc.desc      Verify tree depth of four and symmetric spacing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDslDataset0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDslDataset0716 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual maxDepth(root)=${maxDepth(root)}, expected=4`);
      expect(maxDepth(root)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger maxDepth(root)=${maxDepth(root)}, expected=1`);
      expect(maxDepth(root)).assertLarger(1);
      for (let i: number = 0; i < allNodes.length; i++) {
        const css: ESObject = allNodes[i].css;
        if (css.padding !== undefined) {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.padding.left)=${Number(css.padding.left)}`);
          expect(Number(css.padding.left)).assertEqual(Number(css.padding.right));
        }
        if (css.margin !== undefined) {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(css.margin.top)=${Number(css.margin.top)}`);
          expect(Number(css.margin.top)).assertEqual(Number(css.margin.bottom));
        }
      }
      log('testDslDataset0716 end');
    })
  })
}
