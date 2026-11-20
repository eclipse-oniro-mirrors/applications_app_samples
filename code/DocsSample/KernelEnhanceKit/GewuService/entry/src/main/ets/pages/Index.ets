/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const DOMAIN = 0xFF00;
const TAG = 'Sample_GewuService';
const DEFAULT_MODEL_DIR = 'Qwen2_5_0_5B_CPU_Q4';
const IDLE_DESTROY_MS = 30000;

class ChatMessage {
  id: number;
  role: string;
  content: string;
  aborted: boolean;

  constructor(id: number, role: string, content: string, aborted: boolean = false) {
    this.id = id;
    this.role = role;
    this.content = content;
    this.aborted = aborted;
  }
}

interface GewuRequestMessage {
  role: string;
  content: string;
}

@Entry
@Component
struct Index {
  @State modelDir: string = DEFAULT_MODEL_DIR;
  @State messages: ChatMessage[] = [];
  @State inputText: string = '';
  @State isLoading: boolean = false;
  @State sessionAlive: boolean = false;
  @State statusText: string = 'Enter a prompt and send. Session auto-creates on first send, auto-destroys after 30s idle.';
  private scroller: Scroller = new Scroller();
  private nextId: number = 0;
  private idleTimer: number = -1;
  private abortPending: boolean = false;

  private getModelPath(): string {
    let modelDir: string = this.modelDir.trim();
    if (modelDir.length === 0) {
      modelDir = DEFAULT_MODEL_DIR;
    }
    if (modelDir.startsWith('/')) {
      return modelDir;
    }
    let hostFilesDir: string = this.getUIContext().getHostContext()?.getApplicationContext().filesDir ?? '';
    return hostFilesDir + '/' + modelDir;
  }

  private appendMessage(role: string, content: string, aborted: boolean = false): void {
    let newMessages: ChatMessage[] = this.messages.slice(0);
    this.nextId++;
    newMessages.push(new ChatMessage(this.nextId, role, content, aborted));
    this.messages = newMessages;
  }

  private appendSystemNote(content: string): void {
    this.appendMessage('system', content);
  }

  private buildMessagesJson(): string {
    let requestMessages: GewuRequestMessage[] = [];
    let systemMessage: GewuRequestMessage = { role: 'developer', content: 'You are a helpful assistant' };
    requestMessages.push(systemMessage);
    for (let i = 0; i < this.messages.length; i++) {
      let item: ChatMessage = this.messages[i];
      if (item.role === 'user' || item.role === 'assistant') {
        let message: GewuRequestMessage = { role: item.role, content: item.content };
        requestMessages.push(message);
      }
    }
    return JSON.stringify(requestMessages);
  }

  private clearIdleTimer(): void {
    if (this.idleTimer !== -1) {
      clearTimeout(this.idleTimer);
      this.idleTimer = -1;
    }
  }

  private restartIdleTimer(): void {
    this.clearIdleTimer();
    if (!this.sessionAlive) {
      return;
    }
    this.idleTimer = setTimeout(() => {
      this.destroySessionAfterIdle();
    }, IDLE_DESTROY_MS);
  }

  private destroySessionAfterIdle(): void {
    this.idleTimer = -1;
    if (!this.sessionAlive) {
      return;
    }
    let code: number = testNapi.destroySession();
    hilog.info(DOMAIN, TAG, 'destroySession after 30s idle, code=%{public}d', code);
    this.sessionAlive = false;
    if (code === 0) {
      this.statusText = 'Session destroyed after 30s idle. Next send creates a new one.';
      this.appendSystemNote('Session idle for 30s, destroyed automatically.');
    } else {
      this.statusText = 'destroySession after idle failed, code=' + code.toString();
    }
  }

  private scrollToBottom(): void {
    setTimeout(() => {
      this.scroller.scrollEdge(Edge.Bottom);
    }, 50);
  }

  private async sendMessage(): Promise<void> {
    let text: string = this.inputText.trim();
    if (text.length === 0 || this.isLoading) {
      return;
    }
    this.inputText = '';
    this.appendMessage('user', text);
    this.isLoading = true;
    this.abortPending = false;
    this.clearIdleTimer();

    if (!this.sessionAlive) {
      this.statusText = 'Creating session...';
      let createCode: number = await testNapi.createSession(this.getModelPath());
      hilog.info(DOMAIN, TAG, 'createSession code=%{public}d model=%{public}s', createCode, this.getModelPath());
      if (createCode !== 0) {
        this.isLoading = false;
        this.statusText = 'createSession failed, code=' + createCode.toString();
        this.appendSystemNote('Create session failed (code ' + createCode.toString() + '). Check the model path.');
        this.restartIdleTimer();
        return;
      }
      this.sessionAlive = true;
      this.statusText = 'Session created. Generating answer...';
    }

    let requestJson: string = this.buildMessagesJson();
    let submitCode: number = await testNapi.submitRequest(requestJson);
    let response: string = testNapi.getResponse();
    hilog.info(DOMAIN, TAG, 'submitRequest code=%{public}d response=%{public}s', submitCode, response);
    this.isLoading = false;

    if (submitCode === 0) {
      if (this.abortPending) {
        this.statusText = 'Request aborted. Session active, idle 30s will destroy it.';
        if (response.length > 0) {
          this.appendMessage('assistant', response, true);
        } else {
          this.appendSystemNote('Request aborted, no response received.');
        }
      } else if (response.length > 0) {
        this.appendMessage('assistant', response);
        this.statusText = 'Session active. Idle 30s will destroy it.';
      } else {
        this.appendSystemNote('No response received.');
        this.statusText = 'Session active. Idle 30s will destroy it.';
      }
    } else {
      this.statusText = 'submitRequest failed, code=' + submitCode.toString();
      this.appendSystemNote('Submit request failed (code ' + submitCode.toString() + ').');
    }
    this.restartIdleTimer();
    this.scrollToBottom();
  }

  private stopRequest(): void {
    if (!this.isLoading) {
      return;
    }
    let code: number = testNapi.abortRequest();
    hilog.info(DOMAIN, TAG, 'abortRequest code=%{public}d', code);
    if (code === 0) {
      this.abortPending = true;
      this.statusText = 'Aborting request...';
    } else {
      this.appendSystemNote('Abort request failed (code ' + code.toString() + ').');
    }
  }

  aboutToDisappear(): void {
    this.clearIdleTimer();
  }

  @Builder
  ChatBubble(item: ChatMessage) {
    if (item.role === 'system') {
      Row() {
        Text(item.content)
          .fontSize(12)
          .fontColor('#999999')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    } else if (item.role === 'user') {
      Row() {
        Column() {
          Text(item.content)
            .fontSize(15)
            .fontColor(Color.White)
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor('#1677FF')
        .borderRadius(12)
        .padding({ left: 12, right: 12, top: 8, bottom: 8 })
        .constraintSize({ maxWidth: '80%' })
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
    } else {
      Row() {
        Column() {
          if (item.content.length > 0) {
            Text(item.content)
              .fontSize(15)
              .fontColor('#333333')
          }
          if (item.aborted) {
            Text('— stopped by user')
              .fontSize(12)
              .fontColor('#999999')
              .margin({ top: 4 })
          }
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .border({ width: 1, color: '#E5E6EB' })
        .padding({ left: 12, right: 12, top: 8, bottom: 8 })
        .constraintSize({ maxWidth: '80%' })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
    }
  }

  @Builder
  ThinkingBubble() {
    Row() {
      Row({ space: 8 }) {
        LoadingProgress()
          .width(18)
          .height(18)
        Text('Thinking...')
          .fontSize(14)
          .fontColor('#333333')
      }
      .padding({ left: 12, right: 12, top: 8, bottom: 8 })
      .backgroundColor(Color.White)
      .borderRadius(12)
      .border({ width: 1, color: '#E5E6EB' })
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }

  build() {
    Column() {
      Text('Gewu Service Sample')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 24, bottom: 4 })
      Text('QoS-aware on-device inference acceleration')
        .fontSize(13)
        .fontColor('#666666')
        .margin({ bottom: 8 })

      Row({ space: 8 }) {
        Text('Model path')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        TextInput({ text: this.modelDir, placeholder: 'Model dir name or absolute path' })
          .layoutWeight(1)
          .height(36)
          .onChange((value: string) => {
            this.modelDir = value;
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 4 })

      Text(this.statusText)
        .fontSize(12)
        .fontColor('#999999')
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 4 })

      Scroll(this.scroller) {
        Column({ space: 12 }) {
          ForEach(this.messages, (item: ChatMessage) => {
            this.ChatBubble(item)
          }, (item: ChatMessage) => item.id.toString())

          if (this.isLoading) {
            this.ThinkingBubble()
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8, bottom: 16 })
      }
      .layoutWeight(1)
      .width('100%')
      .scrollable(ScrollDirection.Vertical)
      .backgroundColor('#F7F8FA')

      Row({ space: 8 }) {
        TextInput({ text: this.inputText, placeholder: 'Enter your prompt...' })
          .layoutWeight(1)
          .height(40)
          .enterKeyType(EnterKeyType.Send)
          .onChange((value: string) => {
            this.inputText = value;
          })
          .onSubmit((enter: EnterKeyType) => {
            if (enter === EnterKeyType.Send) {
              this.sendMessage();
            }
          })
        Button(this.isLoading ? 'Stop' : 'Send', { type: ButtonType.Capsule })
          .height(40)
          .onClick(() => {
            if (this.isLoading) {
              this.stopRequest();
            } else {
              this.sendMessage();
            }
          })
      }
      .width('100%')
      .padding(8)

      Text('Tip: filter hilog with tag "Sample_GewuService" or "DEMO" to view native logs.')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 8 })
    }
    .width('100%')
    .height('100%')
  }
}
