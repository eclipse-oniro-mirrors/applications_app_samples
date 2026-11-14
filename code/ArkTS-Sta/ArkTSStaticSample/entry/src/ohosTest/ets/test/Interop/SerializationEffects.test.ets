/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { ControlledParser, LayoutGroup, makeGroup } from '../Shared/ScenarioSupport';
import { withParser, expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import {
  SerializationProbe, setReadProperty, setHiddenProperty, inheritProperty
} from '../Shared/BoundaryFixtures';

export default function serializationEffectsTest(): void {
  describe('SerializationEffectsTest', () => {
    beforeEach(yieldBetweenCases);

    it('SerializationEffectsTest_gettersRunBeforeNativeSynchronousFailure', 0, async () => {
      const native = new ControlledParser();
      const failure = new Error('native parse failed after serialization');
      native.failure = failure;
      native.synchronousFailure = true;
      const probe = new SerializationProbe();
      await withParser(native, async (wrapper) => {
        expectSyncFailure(() => { wrapper.parse(probe); }, failure);
        expect(probe.calls).assertEqual(1);
        expect(probe.events).assertDeepEquals(['serialize']);
        expect(native.inputs).assertDeepEquals(['[]']);
      });
    });

    it('SerializationEffectsTest_nonEnumerableGetterIsNotInvoked', 0, async () => {
      const native = new ControlledParser();
      const group = makeGroup('round2.serialize.hidden', 1, 'hidden');
      let reads = 0;
      const hidden = new SerializationProbe();
      setReadProperty(hidden, 'result', () => {
        reads++;
        throw new Error('hidden value must not serialize');
      });
      setHiddenProperty(group.data[0], 'hidden', hidden);
      const expected = JSON.stringify([makeGroup(group.type, 1, 'hidden')]);
      await withParser(native, async (wrapper) => {
        await wrapper.parse([group]);
        expect(reads).assertEqual(0);
        expect(hidden.calls).assertEqual(0);
        expect(native.inputs).assertDeepEquals([expected]);
      });
    });

    it('SerializationEffectsTest_inheritedFieldsAreExcludedFromNativeJson', 0, async () => {
      const native = new ControlledParser();
      const group = makeGroup('round2.serialize.inherited', 1, 'own');
      inheritProperty(group.data[0], 'inheritedTag', 'not-own');
      await withParser(native, async (wrapper) => {
        await wrapper.parse([group]);
        const encoded = native.inputs[0] as string;
        expect(encoded.includes('inheritedTag')).assertFalse();
        const decoded: LayoutGroup[] = JSON.parse(encoded);
        expect(decoded[0].data[0].item.title.name).assertEqual('own:0');
        expect(decoded[0].data[0].sequence).assertEqual(0);
      });
    });

    it('SerializationEffectsTest_sharedPayloadIsSerializedTwiceWithoutCycleFailure', 0, async () => {
      const native = new ControlledParser();
      const group = makeGroup('round2.serialize.alias', 1, 'shared');
      group.data.push(group.data[0]);
      await withParser(native, async (wrapper) => {
        await wrapper.parse([group]);
        const decoded: LayoutGroup[] = JSON.parse(native.inputs[0] as string);
        expect(decoded[0].data.length).assertEqual(2);
        expect(decoded[0].data[0] === decoded[0].data[1]).assertFalse();
        expect(JSON.stringify(decoded[0].data[0])).assertEqual(JSON.stringify(decoded[0].data[1]));
        expect(group.data[0] === group.data[1]).assertTrue();
      });
    });

    it('SerializationEffectsTest_nestedToJsonRunsForEachPayloadOccurrence', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      probe.result = makeGroup('round2.serialize.nested', 1, 'nested').data[0];
      const group = makeGroup('round2.serialize.nested', 0, 'unused');
      setReadProperty(group, 'data', () => [probe, probe]);
      await withParser(native, async (wrapper) => {
        await wrapper.parse([group]);
        expect(probe.calls).assertEqual(2);
        const decoded: LayoutGroup[] = JSON.parse(native.inputs[0] as string);
        expect(decoded[0].data.length).assertEqual(2);
        expect(decoded[0].data[1].item.title.name).assertEqual('nested:0');
      });
    });

    it('SerializationEffectsTest_eachRequestReserializesMutableInput', 0, async () => {
      const native = new ControlledParser();
      const probe = new SerializationProbe();
      await withParser(native, async (wrapper) => {
        await wrapper.parse(probe);
        probe.result = [makeGroup('round2.serialize.refresh', 1, 'second')];
        await wrapper.parse(probe);
        expect(probe.calls).assertEqual(2);
        expect(native.inputs[0]).assertEqual('[]');
        const second: LayoutGroup[] = JSON.parse(native.inputs[1] as string);
        expect(second[0].data[0].item.title.name).assertEqual('second:0');
      });
    });

    it('SerializationEffectsTest_laterPayloadFailureLeavesNoPartialNativeSubmission', 0, async () => {
      const native = new ControlledParser();
      const group = makeGroup('round2.serialize.partial', 2, 'partial');
      const events: string[] = [];
      const firstStyle = group.data[0].style;
      const failure = new Error('second payload serialization failed');
      setReadProperty(group.data[0], 'style', () => {
        events.push('first');
        return firstStyle;
      });
      setReadProperty(group.data[1], 'style', () => {
        events.push('second');
        throw failure;
      });
      await withParser(native, async (wrapper) => {
        expectSyncFailure(() => { wrapper.parse([group]); }, failure);
        expect(events).assertDeepEquals(['first', 'second']);
        expect(native.inputs.length).assertEqual(0);
      });
    });
  });
}
