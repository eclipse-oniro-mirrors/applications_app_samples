/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
