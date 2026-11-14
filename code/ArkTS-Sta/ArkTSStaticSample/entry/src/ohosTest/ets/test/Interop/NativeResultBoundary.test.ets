/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import {
  CardPayload, ControlledParser, makeSource, makePayload, RecordingResolver, snapshotTitles
} from '../Shared/ScenarioSupport';
import { ProbeSource, withParser, expectRejection, yieldBetweenCases } from '../Shared/BoundarySupport';
import { setReadProperty, freezeObject } from '../Shared/BoundaryFixtures';

export default function nativeResultBoundaryTest(): void {
  describe('NativeResultBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('NativeResultBoundaryTest_unknownCardDoesNotReadItsDataGetter', 0, async () => {
      const native = new ControlledParser();
      native.result = makeSource('round2.native-result.missing', 1, 'unknown');
      let reads = 0;
      setReadProperty(native.result.getData(0), 'data', () => {
        reads++;
        throw new Error('unknown card payload must not be read');
      });
      await withParser(native, async (wrapper) => {
        expect((await wrapper.parse([])).totalCount()).assertEqual(0);
        expect(reads).assertEqual(0);
      });
    });

    it('NativeResultBoundaryTest_knownCardDataGetterFailureRejectsBeforeResolver', 0, async () => {
      const type = 'round2.native-result.data-failure';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const native = new ControlledParser();
      native.result = makeSource(type, 1, 'broken');
      const failure = new Error('native data accessor failed');
      setReadProperty(native.result.getData(0), 'data', () => { throw failure; });
      await withParser(native, async (wrapper) => {
        await expectRejection(wrapper.parse([]), failure);
        expect(resolver.calls).assertEqual(0);
        native.result = makeSource(type, 1, 'recovered');
        expect(snapshotTitles(await wrapper.parse([]))).assertDeepEquals(['recovered:0']);
        expect(resolver.calls).assertEqual(1);
      });
    });

    it('NativeResultBoundaryTest_typeGetterFailurePreventsPayloadRead', 0, async () => {
      const native = new ControlledParser();
      native.result = makeSource('round2.native-result.type-failure', 1, 'broken');
      const failure = new Error('native type accessor failed');
      let payloadReads = 0;
      setReadProperty(native.result.getData(0), 'type', () => { throw failure; });
      setReadProperty(native.result.getData(0), 'data', () => {
        payloadReads++;
        return makePayload('unread', '0%', 0);
      });
      await withParser(native, async (wrapper) => {
        await expectRejection(wrapper.parse([]), failure);
        expect(payloadReads).assertEqual(0);
      });
    });

    it('NativeResultBoundaryTest_missingNativeItemRejectsInsteadOfSilentlyShorteningOutput', 0, async () => {
      const type = 'round2.native-result.short-source';
      registry.registerCard(type, new RecordingResolver());
      const input = new ProbeSource();
      input.dataList = makeSource(type, 1, 'present').dataList;
      input.reportedCount = 2;
      const native = new ControlledParser();
      native.result = input;
      await withParser(native, async (wrapper) => {
        let rejected = false;
        try {
          await wrapper.parse([]);
        } catch (error) {
          rejected = error instanceof TypeError;
        }
        expect(rejected).assertTrue();
        expect(input.events).assertDeepEquals(['count', 'read:0', 'read:1']);
        input.reportedCount = 1;
        expect(snapshotTitles(await wrapper.parse([]))).assertDeepEquals(['present:0']);
      });
    });

    it('NativeResultBoundaryTest_frozenNativeContainerAndCardCanBeConverted', 0, async () => {
      const type = 'round2.native-result.frozen';
      registry.registerCard(type, new RecordingResolver());
      const native = new ControlledParser();
      native.result = makeSource(type, 1, 'frozen');
      const card = native.result.getData(0);
      const id = card.getObjectId();
      freezeObject(card);
      freezeObject(native.result.dataList);
      freezeObject(native.result);
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        expect(snapshotTitles(output)).assertDeepEquals(['frozen:0']);
        expect(output.getData(0) === card).assertFalse();
        expect(output.getData(0).data === card.data).assertTrue();
        expect(card.getObjectId()).assertEqual(id);
      });
    });

    it('NativeResultBoundaryTest_outputKeepsCapturedFieldsAfterNativeCardRebinding', 0, async () => {
      const type = 'round2.native-result.rebinding';
      registry.registerCard(type, new RecordingResolver());
      const native = new ControlledParser();
      native.result = makeSource(type, 1, 'original');
      const card = native.result.getData(0);
      const original: CardPayload = card.data;
      await withParser(native, async (wrapper) => {
        const output = await wrapper.parse([]);
        card.type = type + '.changed';
        card.data = makePayload('replacement', '50%', 8);
        native.result.dataList = [];
        expect(output.getData(0).type).assertEqual(type);
        expect(output.getData(0).data === original).assertTrue();
        expect(snapshotTitles(output)).assertDeepEquals(['original:0']);
        expect(native.result.totalCount()).assertEqual(0);
      });
    });
  });
}
