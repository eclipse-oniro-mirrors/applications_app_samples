'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Component, State, Column, Row, Text, Button } from '@kit.ArkUI';
import { SlotHistoryFixture } from './SlotHistoryFixture';
import { OwnerHistoryFixture } from './OwnerHistoryFixture';
import { PropHistoryFixture } from './PropHistoryFixture';
import { GC } from 'std/core';
import { JSRuntime } from 'std/interop/js';
import hilog from '@ohos.hilog';

let sectionMounts: number = 0;

@Component
export struct HistoryFixture {
  @State section: string = 'none';

  private selectSection(section: string): void {
    // The driver has already observed "none", so the previous controller is
    // unmounted. Collect cross-runtime references between independent scenes;
    // no collection is injected into a case's state transitions or assertions.
    sectionMounts++;
    if (sectionMounts % 16 === 0) {
      const before = GC.getUsedHeapSize();
      GC.waitForFinishGC(JSRuntime.xgc());
      hilog.info(0, 'BuilderParamFixtureGc', 'Boundary GC heap bytes: %{public}s -> %{public}s',
        before.toString(), GC.getUsedHeapSize().toString());
    }
    this.section = section;
  }

  build(): void {
    Column() {
      Row() {
        Button('Slots').id('history-slots').onClick(() => { this.selectSection('slots'); })
        Button('Owners').id('history-owners').onClick(() => { this.selectSection('owners'); })
        Button('Props').id('history-props').onClick(() => { this.selectSection('props'); })
        Button('Reset').id('history-reset').onClick(() => { this.section = 'none'; })
      }
      Text(this.section).id('history-section')
      if (this.section === 'slots') {
        SlotHistoryFixture()
      } else if (this.section === 'owners') {
        OwnerHistoryFixture()
      } else if (this.section === 'props') {
        PropHistoryFixture()
      }
    }
    .width('100%')
  }
}
