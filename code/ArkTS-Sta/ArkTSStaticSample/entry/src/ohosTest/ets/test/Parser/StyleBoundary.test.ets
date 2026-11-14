/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { CardStyle, makeGroup, RecordingResolver } from '../Shared/ScenarioSupport';
import { CallbackResolver, yieldBetweenCases } from '../Shared/BoundarySupport';
import { setWidthDescriptor, setWidthAccessor, removeWidth, hasOwn } from '../Shared/BoundaryFixtures';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function styleBoundaryTest(): void {
  describe('StyleBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('StyleBoundaryTest_nonEnumerableWidthStaysHidden', 0, async () => {
      const type = 'boundary.style.hidden';
      const group = makeGroup(type, 1, 'hidden');
      setWidthDescriptor(group.data[0].style, '81%', false, true);
      registry.registerCard(type, new RecordingResolver());
      const source = await new DataParser(() => {}).parse([group]);
      const style: CardStyle = source.getData(0).opt('style');
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.enumerable).assertFalse();
      expect(descriptor.configurable).assertTrue();
      expect(JSON.stringify(style)).assertEqual('{"theme":"light"}');
    });

    // Characterize the existing Reflect.defineProperty failure policy.
    it('StyleBoundaryTest_lockedWidthIsPreservedWhenDefinitionFails', 0, async () => {
      const type = 'boundary.style.locked';
      const group = makeGroup(type, 1, 'locked');
      setWidthDescriptor(group.data[0].style, '81%', true, false);
      registry.registerCard(type, new RecordingResolver());
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const style: CardStyle = source.getData(0).opt('style');
      expect(style.width).assertEqual('81%');
      expect(inspectProperty(style, 'width').hasGetter).assertFalse();
      expect(inspectProperty(style, 'width').configurable).assertFalse();
      expect(source.getData(0).data === group.data[0]).assertTrue();
    });

    it('StyleBoundaryTest_missingWidthGetsDefaultDescriptorFlags', 0, async () => {
      const type = 'boundary.style.absent';
      const group = makeGroup(type, 1, 'absent');
      removeWidth(group.data[0].style);
      registry.registerCard(type, new RecordingResolver());
      const source = await new DataParser(() => {}).parse([group]);
      const style: CardStyle = source.getData(0).opt('style');
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertFalse();
      expect(descriptor.configurable).assertFalse();
      expect(hasOwn(style, 'width')).assertTrue();
    });

    it('StyleBoundaryTest_redefinitionReplacesGetterAndRetainsSetter', 0, async () => {
      const type = 'boundary.style.accessor';
      const group = makeGroup(type, 1, 'accessor');
      let originalReads = 0;
      const writes: string[] = [];
      setWidthAccessor(group.data[0].style, () => {
        originalReads++;
        return 'original';
      }, (value) => { writes.push(value); });
      registry.registerCard(type, new RecordingResolver());
      const source = await new DataParser(() => {}).parse([group]);
      const style: CardStyle = source.getData(0).opt('style');
      expect(originalReads).assertEqual(0);
      expect(inspectProperty(style, 'width').hasSetter).assertTrue();
      style.width = 'written';
      expect(writes).assertDeepEquals(['written']);
      expect(style.width.endsWith('%')).assertTrue();
      expect(originalReads).assertEqual(0);
    });

    it('StyleBoundaryTest_parseInstallsFormulaWithoutEvaluatingIt', 0, async () => {
      const type = 'boundary.style.lazy';
      registry.registerCard(type, new RecordingResolver());
      const parser = new DataParser(() => {});
      const first = await parser.parse([makeGroup(type, 1, 'anchor')]);
      const anchor: CardStyle = first.getData(0).opt('style');
      const before = Number.parseFloat(anchor.width);
      const pending = await parser.parse([makeGroup(type, 3, 'unread')]);
      expect(pending.totalCount()).assertEqual(3);
      expect(Number.parseFloat(anchor.width)).assertEqual(before - 10);
    });

    it('StyleBoundaryTest_serializationEvaluatesEachEnumerableWidthOnce', 0, async () => {
      const type = 'boundary.style.serialize';
      registry.registerCard(type, new RecordingResolver());
      const group = makeGroup(type, 2, 'json');
      const source = await new DataParser(() => {}).parse([group]);
      const first: CardStyle = source.getData(0).opt('style');
      const before = Number.parseFloat(first.width);
      const encoded: CardStyle[] = JSON.parse(JSON.stringify([first, group.data[1].style]));
      expect(Number.parseFloat(encoded[0].width)).assertEqual(before - 10);
      expect(Number.parseFloat(encoded[1].width)).assertEqual(before - 20);
      expect(Number.parseFloat(first.width)).assertEqual(before - 30);
      expect(group.data[0].item.title.name).assertEqual('json:0');
    });

    it('StyleBoundaryTest_resolverReplacementStyleReceivesFormula', 0, async () => {
      const type = 'boundary.style.replaced';
      const group = makeGroup(type, 1, 'replace');
      const original = group.data[0].style;
      const replacement: CardStyle = { width: '40%', theme: 'replacement' };
      registry.registerCard(type, new CallbackResolver((model) => {
        model.data.style = replacement;
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.getData(0).opt('style') === replacement).assertTrue();
      expect(inspectProperty(replacement, 'width').hasGetter).assertTrue();
      expect(inspectProperty(original, 'width').hasGetter).assertFalse();
      expect(original.width).assertEqual('100%');
      expect(replacement.theme).assertEqual('replacement');
    });

    it('StyleBoundaryTest_sharedStyleRemainsSharedAcrossCardCreation', 0, async () => {
      const type = 'boundary.style.shared';
      registry.registerCard(type, new RecordingResolver());
      const group = makeGroup(type, 2, 'shared');
      group.data[1].style = group.data[0].style;
      const source = await new DataParser(() => {}).parse([group]);
      const first: CardStyle = source.getData(0).opt('style');
      const second: CardStyle = source.getData(1).opt('style');
      expect(first === second).assertTrue();
      expect(source.getData(0) === source.getData(1)).assertFalse();
      first.theme = 'shared-update';
      expect(second.theme).assertEqual('shared-update');
      const width = Number.parseFloat(first.width);
      expect(Number.parseFloat(second.width)).assertEqual(width - 10);
    });
  });
}
