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

// Reference: ets/test/LifecycleState/DialogLifecycle.test.ets
// Original line floor: 270; scenario family: parser-reuse.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { DataParser as DynamicParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { fibonacciRecursive as libraryFibonacci } from 'library/src/main/ets/components/dyn/Workload';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { fibonacciRecursive as entryFibonacci } from '../../../../main/ets/pages/Workload';
import bundledLayout from '../../../../main/ets/pages/jsonData.json';
import {
  CardPayload, CardStyle, LayoutGroup, makePayload, makeModel, makeGroup, makeSource,
  assertSource, assertUniqueIds, snapshotTitles, RecordingResolver, ListenerRecorder,
  ControlledParser, ControlledFactory, waitForNativeFactory, logSuite, expectedFibonacci
} from '../Shared/ScenarioSupport';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function ParserReuseTest(): void {
  describe('ParserReuseTest', () => {
    beforeAll(() => {
      logSuite('ParserReuseTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ParserReuseTest', 'end');
    });

    /**
     * @tc.name ParserReuseTest_case_001
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 1, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 2, 'second')]);
      await assertSource(second, type, 2, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(3);
      expect(first.totalCount()).assertEqual(1);
    });

    /**
     * @tc.name ParserReuseTest_case_002
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 2, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 3, 'second')]);
      await assertSource(second, type, 3, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(5);
      expect(first.totalCount()).assertEqual(2);
    });

    /**
     * @tc.name ParserReuseTest_case_003
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 3, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 4, 'second')]);
      await assertSource(second, type, 4, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(7);
      expect(first.totalCount()).assertEqual(3);
    });

    /**
     * @tc.name ParserReuseTest_case_004
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 4, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 5, 'second')]);
      await assertSource(second, type, 5, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(9);
      expect(first.totalCount()).assertEqual(4);
    });

    /**
     * @tc.name ParserReuseTest_case_005
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 5, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 6, 'second')]);
      await assertSource(second, type, 6, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(11);
      expect(first.totalCount()).assertEqual(5);
    });

    /**
     * @tc.name ParserReuseTest_case_006
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 1, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 2, 'second')]);
      await assertSource(second, type, 2, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(3);
      expect(first.totalCount()).assertEqual(1);
    });

    /**
     * @tc.name ParserReuseTest_case_007
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 2, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 3, 'second')]);
      await assertSource(second, type, 3, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(5);
      expect(first.totalCount()).assertEqual(2);
    });

    /**
     * @tc.name ParserReuseTest_case_008
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 3, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 4, 'second')]);
      await assertSource(second, type, 4, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(7);
      expect(first.totalCount()).assertEqual(3);
    });

    /**
     * @tc.name ParserReuseTest_case_009
     * @tc.desc parser-reuse: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ParserReuseTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-reuse.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = await parser.parse([makeGroup(type, 4, 'first')]);
      const titlesBefore = snapshotTitles(first);
      const idsBefore: string[] = [];
      for (let index = 0; index < first.totalCount(); index++) {
        idsBefore.push(first.getData(index).getObjectId());
      }
      const second = await parser.parse([makeGroup(type, 5, 'second')]);
      await assertSource(second, type, 5, 'second');
      expect(snapshotTitles(first)).assertDeepEquals(titlesBefore);
      expect(first === second).assertFalse();
      expect(idsBefore.indexOf(second.getData(0).getObjectId())).assertEqual(-1);
      expect(resolver.calls).assertEqual(9);
      expect(first.totalCount()).assertEqual(4);
    });
  });
}
