/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { ControlledParser, LayoutGroup, makeGroup, RecordingResolver } from '../Shared/ScenarioSupport';
import { withParser, expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { SerializationProbe, cyclicLayout, bigintLayout, setWidthAccessor } from '../Shared/BoundaryFixtures';

export default function serializationBoundaryTest(): void {
  describe('SerializationBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('SerializationBoundaryTest_cyclicObjectFailsBeforeNativeCall', 0, async () => {
      const native = new ControlledParser();
      await withParser(native, async (wrapper) => {
        let caught = false;
        try {
          wrapper.parse(cyclicLayout('boundary.serialization.cycle'));
        } catch (error) {
          caught = error instanceof TypeError;
        }
        expect(caught).assertTrue();
        expect(native.inputs.length).assertEqual(0);
        expect((await wrapper.parse([])).totalCount()).assertEqual(0);
        expect(native.inputs.length).assertEqual(1);
      });
    });

    it('SerializationBoundaryTest_bigintFailsBeforeNativeCall', 0, async () => {
      const native = new ControlledParser();
      await withParser(native, async (wrapper) => {
        let caught = false;
        try {
          wrapper.parse(bigintLayout());
        } catch (error) {
          caught = error instanceof TypeError;
        }
        expect(caught).assertTrue();
        expect(native.inputs.length).assertEqual(0);
      });
    });

    it('SerializationBoundaryTest_toJsonRunsOnceAndSuppliesNativeInput', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      probe.result = [makeGroup('boundary.serialization.to-json', 1, 'custom')];
      const expected = JSON.stringify(probe.result);
      await withParser(native, async (wrapper) => {
        await wrapper.parse(probe);
        expect(probe.calls).assertEqual(1);
        expect(native.inputs).assertDeepEquals([expected]);
      });
    });

    it('SerializationBoundaryTest_toJsonFailurePropagatesSynchronously', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      const failure = new Error('toJSON failed');
      probe.failure = failure;
      await withParser(native, async (wrapper) => {
        expectSyncFailure(() => { wrapper.parse(probe); }, failure);
        expect(probe.calls).assertEqual(1);
        expect(native.inputs.length).assertEqual(0);
        probe.failure = undefined;
        await wrapper.parse(probe);
        expect(probe.calls).assertEqual(2);
        expect(native.inputs).assertDeepEquals(['[]']);
      });
    });

    it('SerializationBoundaryTest_toJsonStringIsEncodedAsJsonString', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      probe.result = '[]';
      await withParser(native, async (wrapper) => {
        await wrapper.parse(probe);
        await wrapper.parse('[]');
        expect(native.inputs).assertDeepEquals(['"[]"', '[]']);
        expect(probe.calls).assertEqual(1);
      });
    });

    it('SerializationBoundaryTest_invalidStringPassesThroughWithoutLocalParsing', 0, async () => {
      const native = new ControlledParser();
      await withParser(native, async (wrapper) => {
        const invalid = '  [truncated';
        const output = await wrapper.parse(invalid);
        expect(native.inputs).assertDeepEquals([invalid]);
        expect(output.totalCount()).assertEqual(0);
      });
    });

    it('SerializationBoundaryTest_throwingPayloadGetterPreventsNativeCall', 0, async () => {
      const native = new ControlledParser();
      const group = makeGroup('boundary.serialization.getter', 1, 'getter');
      const failure = new Error('width getter failed');
      let reads = 0;
      setWidthAccessor(group.data[0].style, () => {
        reads++;
        throw failure;
      }, () => {});
      await withParser(native, async (wrapper) => {
        expectSyncFailure(() => { wrapper.parse([group]); }, failure);
        expect(reads).assertEqual(1);
        expect(native.inputs.length).assertEqual(0);
      });
    });

    it('SerializationBoundaryTest_dynamicWidthIsEvaluatedDuringSerialization', 0, async () => {
      const type = 'boundary.serialization.dynamic-width';
      registry.registerCard(type, new RecordingResolver());
      const group = makeGroup(type, 1, 'dynamic');
      await new DataParser(() => {}).parse([group]);
      const before = Number.parseFloat(group.data[0].style.width);
      const native = new ControlledParser();
      await withParser(native, async (wrapper) => {
        await wrapper.parse([group]);
        const decoded: LayoutGroup[] = JSON.parse(native.inputs[0] as string);
        expect(Number.parseFloat(decoded[0].data[0].style.width)).assertEqual(before - 10);
        expect(Number.parseFloat(group.data[0].style.width)).assertEqual(before - 20);
        expect(decoded[0].data[0].item.title.name).assertEqual('dynamic:0');
      });
    });
  });
}
