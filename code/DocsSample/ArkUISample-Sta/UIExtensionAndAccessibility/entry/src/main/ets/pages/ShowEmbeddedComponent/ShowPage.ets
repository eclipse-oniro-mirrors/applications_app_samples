'use static';

import { NodeContent } from '@ohos.arkui.node';
import { Builder, Entry, Component, Column, ColumnOptions, Text, FontWeight, ContentSlot } from '@ohos.arkui.component';

export class NativeMethods {
  static {
    loadLibrary("entry")
  }

  static native createNativeNode(content: NodeContent): void;

  static native destroyNativeNode(content: NodeContent): void;
}

export const EMBEDDED_COMPONENT_ROUTE_PREFIX: string = 'ShowEmbeddedComponent';

@Builder
export function ShowEmbedded(name: string): void {
  if (name == EMBEDDED_COMPONENT_ROUTE_PREFIX) {
    ShowPage();
  }
}

@Entry
@Component
export struct ShowPage {
  private nodeContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    NativeMethods.createNativeNode(this.nodeContent as NodeContent);
  }

  aboutToDisappear(): void {
    NativeMethods.destroyNativeNode(this.nodeContent as NodeContent);
  }

  build(): void {
    Column({ space: 16 } as ColumnOptions) {
      Text('ShowPage content')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text('Native render (libentry.so)')
        .fontSize(14)
        .fontColor('#999999')
      Column() {
        ContentSlot(this.nodeContent);
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
