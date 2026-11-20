'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Component, State, PropRef, Builder, Column, Row, Text, Button } from '@kit.ArkUI';
import { Card } from '../../../main/ets/pages/Card';

// Separate component instances own the callbacks passed to the real Card.
@Component
struct OwnedHistoryCard {
  @PropRef prefix: string = '';
  @PropRef caption: string = '';
  @State labelCount: number = 0;
  @State footerCount: number = 0;
  @State lastEvent: string = 'None';

  @Builder
  detailBuilder(): void {
    Column() {
      Text(this.caption).id(this.prefix + '-caption')
      Text('Label ' + this.labelCount + '; footer ' + this.footerCount).id(this.prefix + '-counts')
      Text(this.lastEvent).id(this.prefix + '-event')
    }
    .layoutWeight(1)
  }

  @Builder
  labelBuilder(): void {
    Button('Label')
      .id(this.prefix + '-label')
      .height(24)
      .onClick(() => {
        this.labelCount++;
        this.lastEvent = this.caption + ':label';
      })
  }

  @Builder
  bottomBuilder(): void {
    Button('Footer')
      .id(this.prefix + '-footer')
      .height(24)
      .onClick(() => {
        this.footerCount++;
        this.lastEvent = this.caption + ':footer';
      })
  }

  build(): void {
    Card({
      testId: this.prefix,
      bottomContent: this.bottomBuilder,
      detailContent: this.detailBuilder,
      labelContent: this.labelBuilder
    })
      .width('100%')
  }
}

@Component
export struct OwnerHistoryFixture {
  @State primaryVisible: boolean = true;
  @State primaryCaption: string = 'Primary owner';

  build(): void {
    Column() {
      Row() {
        Button('Hide/show')
          .id('owners-toggle-primary')
          .onClick(() => { this.primaryVisible = !this.primaryVisible; })
        Button('Rename')
          .id('owners-rename-primary')
          .onClick(() => { this.primaryCaption = 'Renamed owner'; })
      }
      Text(this.primaryVisible ? 'Mounted' : 'Removed').id('owners-primary-state')
      if (this.primaryVisible) {
        OwnedHistoryCard({ prefix: 'owners-primary', caption: this.primaryCaption })
      }
      OwnedHistoryCard({ prefix: 'owners-sibling', caption: 'Sibling owner' })
    }
    .width('100%')
  }
}
