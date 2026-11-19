'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Component, State, Column, Row, Text, Button, ResourceStr, $r } from '@kit.ArkUI';
import { CustomCard } from '../../../main/ets/pages/Card';

@Component
export struct PropHistoryFixture {
  @State title: string = 'Primary title';
  @State description: ResourceStr = 'Primary description';
  @State siblingTitle: string = 'Sibling title';
  @State siblingDescription: string = 'Sibling description';
  @State cardId: string = 'props-primary';

  reset(): void {
    this.title = 'Primary title';
    this.description = 'Primary description';
    this.siblingTitle = 'Sibling title';
    this.siblingDescription = 'Sibling description';
    this.cardId = 'props-primary';
  }

  build(): void {
    Column() {
      Row() {
        Button('Reset').id('props-reset').onClick(() => this.reset())
        Button('Title').id('props-title').onClick(() => { this.title = 'Changed title'; })
        Button('Detail').id('props-description').onClick(() => { this.description = 'Changed description'; })
      }
      Row() {
        Button('Clear title').id('props-clear-title').onClick(() => { this.title = ''; })
        Button('Clear detail').id('props-clear-description').onClick(() => { this.description = ''; })
        Button('Resource').id('props-resource').onClick(() => {
          this.description = $r('sys.string.general_copy');
        })
      }
      Row() {
        Button('New ID').id('props-rekey').onClick(() => { this.cardId = 'props-renamed'; })
        Button('Sibling').id('props-sibling').onClick(() => {
          this.siblingTitle = 'Changed sibling';
          this.siblingDescription = 'Changed sibling description';
        })
        Button('Multiline').id('props-multiline').onClick(() => {
          this.description = 'First line\nSecond line\nThird line';
        })
      }
      Text($r('sys.string.general_copy')).id('props-resource-reference')
      CustomCard({ testId: this.cardId, title: this.title, description: this.description })
        .width('100%')
      CustomCard({ testId: 'props-sibling', title: this.siblingTitle, description: this.siblingDescription })
        .width('100%')
    }
    .id('props-surface')
    .width('100%')
  }
}
