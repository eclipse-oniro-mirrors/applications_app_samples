/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import fileIo from '@ohos.file.fs';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Rect } from '@ohos.UiTest';
import { driver, runSerializedUiOperation } from './SharedDriver';

interface LayoutAttributes {
  id: string;
  text: string;
  bounds: string;
  visible: string;
}

interface LayoutNode {
  attributes: LayoutAttributes;
  children: LayoutNode[];
}

// A single live UiTest observation for one read-only group of assertions.
// Callers take a new observation for every group; nothing survives a UI action.
export class UiLayoutObservation {
  private nodes: Map<string, LayoutAttributes[]> = new Map();

  constructor(root: LayoutNode) {
    this.collect(root);
  }

  private collect(node: LayoutNode): void {
    const attributes = node.attributes;
    if (attributes.id && attributes.visible !== 'false') {
      const matches = this.nodes.get(attributes.id) || [];
      matches.push(attributes);
      this.nodes.set(attributes.id, matches);
    }
    for (const child of node.children) {
      this.collect(child);
    }
  }

  count(id: string): number {
    const matches = this.nodes.get(id);
    return matches ? matches.length : 0;
  }

  exists(id: string): boolean {
    return this.count(id) > 0;
  }

  private node(id: string): LayoutAttributes {
    const matches = this.nodes.get(id);
    if (!matches || matches.length === 0) {
      throw new Error('Missing UI node in live layout: ' + id);
    }
    return matches[0];
  }

  text(id: string): string {
    return this.node(id).text;
  }

  bounds(id: string): Rect {
    const value = this.node(id).bounds;
    const coordinates = value.match(/^\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]$/);
    if (!coordinates) {
      throw new Error('Invalid live UI bounds for ' + id + ': ' + value);
    }
    return {
      left: Number(coordinates[1]), top: Number(coordinates[2]),
      right: Number(coordinates[3]), bottom: Number(coordinates[4])
    };
  }
}

export async function observeUiLayout(): Promise<UiLayoutObservation> {
  return runSerializedUiOperation(async (): Promise<UiLayoutObservation> => {
    const path = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().cacheDir +
      '/builderparam-ui-observation.json';
    // UiTest can overwrite a shorter dump without truncating the old file.
    if (fileIo.accessSync(path)) {
      fileIo.unlinkSync(path);
    }
    if (!await driver().dumpLayout(path)) {
      throw new Error('Unable to capture live UiTest layout');
    }
    const root = JSON.parse(fileIo.readTextSync(path)) as LayoutNode;
    return new UiLayoutObservation(root);
  });
}
