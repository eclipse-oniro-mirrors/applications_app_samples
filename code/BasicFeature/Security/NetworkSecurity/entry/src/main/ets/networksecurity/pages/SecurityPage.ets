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

import { CertFileItem, EnvironmentCheck, SecurityErrorExplain, HttpProbeResult, InfoRow, LogPanel, SectionCard,
  SecurityErrorCodeMap } from 'library';
import { SecurityViewModel } from '../viewmodel/SecurityViewModel';

// Font size of primary labels and buttons.
const FONT_LABEL: number = 14;
// Font size of secondary hints.
const FONT_HINT: number = 12;
// Line height used by multi-line hint texts.
const LINE_HEIGHT_HINT: number = 18;
// Font size of the main action button.
const BUTTON_FONT: number = 15;
// Horizontal padding of compact buttons.
const BUTTON_PADDING: number = 16;
// Height of the single-line input field.
const INPUT_HEIGHT: number = 48;
// Corner radius of cards and inputs.
const ITEM_RADIUS: number = 8;
// Inner padding of list items and blocks.
const ITEM_PADDING: number = 12;
// Maximum lines of probe result messages.
const HINT_MAX_LINES: number = 2;
// Maximum lines of file names and URLs.
const MAX_LINES: number = 2;
// Height of the sample host chips.
const CHIP_HEIGHT: number = 32;
// Horizontal padding of the sample host chips.
const CHIP_PADDING: number = 12;
// Built-in allowed host used by the cleartext demo.
const HOST_ALLOWED_SAMPLE: string = 'www.example.com';
// Built-in denied host used by the cleartext demo.
const HOST_DENIED_SAMPLE: string = 'www.iana.org';
// Length threshold that treats an empty string as "no value".
const DASH_TEXT_LENGTH: number = 0;

/**
 * Certificate verification and cleartext HTTP policy demo page.
 */
@ComponentV2
export struct SecurityPage {
  // View model that owns the page state and services.
  @Local vm: SecurityViewModel = new SecurityViewModel();

  /**
   * Bind the host context to the view model once the page appears.
   */
  aboutToAppear(): void {
    // Fetch the ability context from the current UI context.
    const context = this.getUIContext().getHostContext();
    // Only bind when the host context is available.
    if (context !== undefined) {
      this.vm.bind(context);
    }
  }

  /**
   * Map an environment check outcome to a status color.
   * @param passed whether the environment check passed.
   * @returns the success color for passed checks, warning color otherwise.
   */
  private passedColor(passed: boolean): ResourceColor {
    // Passed checks render green, limited ones amber.
    return passed ? $r('app.color.success') : $r('app.color.warning');
  }

  /**
   * Map a policy outcome to a status color.
   * @param allowed whether the policy allows the queried item.
   * @returns the success color for allowed items, danger color otherwise.
   */
  private allowedColor(allowed: boolean): ResourceColor {
    // Allowed items render green, denied ones red.
    return allowed ? $r('app.color.success') : $r('app.color.danger');
  }

  /**
   * Map a log level to a text color.
   * @param level log level name such as error, warning or info.
   * @returns the danger, warning or secondary text color.
   */
  private levelColor(level: string): ResourceColor {
    // Errors render in the danger color.
    if (level === 'error') {
      return $r('app.color.danger');
    }
    // Warnings render in the warning color.
    if (level === 'warning' || level === 'warn') {
      return $r('app.color.warning');
    }
    // Everything else falls back to the secondary text color.
    return $r('app.color.text_secondary');
  }

  /**
   * Replace an empty string with a dash placeholder.
   * @param value raw metadata text.
   * @returns the raw text when non-empty, otherwise the dash resource.
   */
  private metaText(value: string): ResourceStr {
    // Show the raw value only when it is non-empty.
    return value.length > DASH_TEXT_LENGTH ? value : $r('app.string.ns_common_dash');
  }

  /**
   * Explain the latest verification result through the error code map.
   * @returns the explain entry that matches the current result code.
   */
  private explain(): SecurityErrorExplain {
    // Delegate the mapping to the shared code map.
    return SecurityErrorCodeMap.explain(this.vm.lastResult.code);
  }

  /**
   * Check whether the latest verification failed.
   * @returns true when a result with a message exists and success is false.
   */
  private hasFailure(): boolean {
    // A failure requires a non-empty message and a success flag of false.
    return this.vm.lastResult.message.length > DASH_TEXT_LENGTH && !this.vm.lastResult.success;
  }

  /**
   * Build the headline of one probe result.
   * @param result probe result to summarize.
   * @returns "HTTP <code>" for successful probes, "code <errorCode>" otherwise.
   */
  private probeHeadline(result: HttpProbeResult): string {
    // Successful probes show the HTTP status code.
    return result.success ? 'HTTP ' + result.httpCode.toString() : 'code ' + result.errorCode.toString();
  }

  /**
   * Build the intro card body with the page description.
   */
  @Builder
  introContent() {
    Column({ space: 8 }) {
      Text($r('app.string.ns_sec_intro_detail'))
        .id('id_security_intro_detail')
        .fontSize(FONT_HINT)
        .fontColor($r('app.color.text_secondary'))
        .lineHeight(LINE_HEIGHT_HINT)
        .width('100%')
    }
    .id('id_security_intro_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the environment check card body with a refresh action.
   */
  @Builder
  environmentContent() {
    Column({ space: 8 }) {
      Row({ space: 12 }) {
        Text($r('app.string.ns_sec_env_hint'))
          .id('id_security_env_hint')
          .fontSize(FONT_HINT)
          .fontColor($r('app.color.text_tertiary'))
          .layoutWeight(1)
        Button($r('app.string.ns_common_refresh'))
          .id('id_security_env_refresh')
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .padding({ left: BUTTON_PADDING, right: BUTTON_PADDING })
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Ask the view model to re-run the environment checks.
            this.vm.refreshEnvironment();
          })
      }
      .id('id_security_env_toolbar')
      .width('100%')
      .height($r('app.float.control_height'))
      .alignItems(VerticalAlign.Center)

      Repeat<EnvironmentCheck>(this.vm.checks)
        .each((repeatItem: RepeatItem<EnvironmentCheck>) => {
          Row({ space: 8 }) {
            Text(repeatItem.item.label)
              .id('id_security_env_label_' + repeatItem.index.toString())
              .fontSize(FONT_LABEL)
              .fontColor($r('app.color.text_primary'))
            Blank()
              .id('id_security_env_blank_' + repeatItem.index.toString())
            Text(repeatItem.item.value)
              .id('id_security_env_value_' + repeatItem.index.toString())
              .fontSize(FONT_LABEL)
              .fontColor($r('app.color.text_secondary'))
              .maxLines(MAX_LINES)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .layoutWeight(1)
              .textAlign(TextAlign.End)
            Text(repeatItem.item.passed ? $r('app.string.ns_common_supported') : $r('app.string.ns_common_limited'))
              .id('id_security_env_state_' + repeatItem.index.toString())
              .fontSize(FONT_HINT)
              .fontColor(this.passedColor(repeatItem.item.passed))
          }
          .id('id_security_env_row_' + repeatItem.index.toString())
          .width('100%')
          .padding({ top: 4, bottom: 4 })
          .alignItems(VerticalAlign.Center)
        })
        .key((item: EnvironmentCheck, index: number) => index.toString())
    }
    .id('id_security_env_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the certificate card body with the file list, metadata and verify actions.
   */
  @Builder
  certContent() {
    Column({ space: 12 }) {
      Column({ space: 8 }) {
        Repeat<CertFileItem>(this.vm.certFiles)
          .each((repeatItem: RepeatItem<CertFileItem>) => {
            Row({ space: 12 }) {
              Column({ space: 4 }) {
                Text(repeatItem.item.label)
                  .id('id_security_cert_label_' + repeatItem.index.toString())
                  .fontSize(FONT_LABEL)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))
                  .width('100%')
                Text(repeatItem.item.detail)
                  .id('id_security_cert_detail_' + repeatItem.index.toString())
                  .fontSize(FONT_HINT)
                  .fontColor($r('app.color.text_tertiary'))
                  .lineHeight(LINE_HEIGHT_HINT)
                  .width('100%')
              }
              .id('id_security_cert_text_' + repeatItem.index.toString())
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text(repeatItem.item.fileName)
                .id('id_security_cert_file_' + repeatItem.index.toString())
                .fontSize(FONT_HINT)
                .fontColor($r('app.color.text_tertiary'))
                .maxLines(MAX_LINES)
            }
            .id('id_security_cert_item_' + repeatItem.index.toString())
            .width('100%')
            .padding(ITEM_PADDING)
            .borderRadius(ITEM_RADIUS)
            .backgroundColor(this.vm.selectedIndex === repeatItem.index ? $r('app.color.brand_light') :
              $r('app.color.fill_subtle'))
            .alignItems(VerticalAlign.Center)
            .onClick(() => {
              // Select the tapped certificate and refresh its metadata.
              this.vm.selectCert(repeatItem.index);
            })
          })
          .key((item: CertFileItem, index: number) => index.toString())
      }
      .id('id_security_cert_list')
      .width('100%')

      InfoRow({
        idPrefix: 'id_security_meta_issuer',
        label: $r('app.string.ns_sec_cert_issuer'),
        value: this.vm.metaLoaded ? this.metaText(this.vm.meta.issuer) : $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_security_meta_not_before',
        label: $r('app.string.ns_sec_cert_not_before'),
        value: this.vm.metaLoaded ? this.metaText(this.vm.meta.notBefore) : $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_security_meta_not_after',
        label: $r('app.string.ns_sec_cert_not_after'),
        value: this.vm.metaLoaded ? this.metaText(this.vm.meta.notAfter) : $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_security_meta_version',
        label: $r('app.string.ns_sec_cert_version'),
        value: this.vm.metaLoaded ? this.vm.meta.version.toString() : $r('app.string.ns_common_dash')
      })
      InfoRow({
        idPrefix: 'id_security_meta_serial',
        label: $r('app.string.ns_sec_cert_serial'),
        value: this.vm.metaLoaded ? this.metaText(this.vm.meta.serial) : $r('app.string.ns_common_dash')
      })

      Row({ space: 8 }) {
        Button($r('app.string.ns_sec_cert_verify_sync'))
          .id('id_security_cert_verify_sync')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Run the synchronous certificate verification.
            this.vm.verifySync();
          })
        Button($r('app.string.ns_sec_cert_verify_async'))
          .id('id_security_cert_verify_async')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Run the asynchronous certificate verification.
            this.vm.verifyAsync();
          })
        Button($r('app.string.ns_sec_cert_verify_chain'))
          .id('id_security_cert_verify_chain')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Verify the full chain against the bundled root CA.
            this.vm.verifyChain();
          })
      }
      .id('id_security_cert_actions')
      .width('100%')

      // Show the result block only after a verification produced a message.
      if (this.vm.lastResult.message.length > DASH_TEXT_LENGTH) {
        Column({ space: 8 }) {
          InfoRow({
            idPrefix: 'id_security_result_code',
            label: $r('app.string.ns_sec_cert_result_code'),
            value: this.vm.lastResult.code.toString(),
            valueColor: this.allowedColor(this.vm.lastResult.success)
          })
          InfoRow({
            idPrefix: 'id_security_result_message',
            label: $r('app.string.ns_sec_cert_result_message'),
            value: this.vm.lastResult.message
          })
          InfoRow({
            idPrefix: 'id_security_result_elapsed',
            label: $r('app.string.ns_sec_cert_result_elapsed'),
            value: this.vm.lastResult.elapsedMs.toString() + ' ms'
          })
        }
        .id('id_security_result_block')
        .width('100%')
        .padding(ITEM_PADDING)
        .borderRadius(ITEM_RADIUS)
        .backgroundColor($r('app.color.fill_subtle'))
        .alignItems(HorizontalAlign.Start)
      }
    }
    .id('id_security_cert_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the cleartext policy card body with global and per-host queries.
   */
  @Builder
  cleartextContent() {
    Column({ space: 12 }) {
      InfoRow({
        idPrefix: 'id_security_cleartext',
        label: $r('app.string.ns_sec_cleartext_global_label'),
        value: this.vm.cleartext.globalAllowed ? $r('app.string.ns_common_allowed') : $r('app.string.ns_common_denied'),
        valueColor: this.allowedColor(this.vm.cleartext.globalAllowed)
      })

      Button($r('app.string.ns_common_query'))
        .id('id_security_cleartext_query')
        .width('100%')
        .height($r('app.float.control_height'))
        .fontSize(BUTTON_FONT)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.card_bg'))
        .backgroundColor($r('app.color.brand_primary'))
        .borderRadius(20)
        .enabled(!this.vm.busy)
        .onClick(() => {
          // Refresh the global cleartext permission state.
          this.vm.queryCleartext();
        })

      Row({ space: 8 }) {
        TextInput({ text: this.vm.hostInput, placeholder: $r('app.string.ns_common_input_host') })
          .id('id_security_cleartext_host_input')
          .layoutWeight(1)
          .height(INPUT_HEIGHT)
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.text_primary'))
          .placeholderColor($r('app.color.text_tertiary'))
          .backgroundColor($r('app.color.fill_subtle'))
          .borderRadius(ITEM_RADIUS)
          .onChange((value: string) => {
            // Keep the view model host input in sync with the field.
            this.vm.hostInput = value;
          })
        Button($r('app.string.ns_common_query'))
          .id('id_security_cleartext_host_query')
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .padding({ left: BUTTON_PADDING, right: BUTTON_PADDING })
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Query the cleartext permission for the entered host.
            this.vm.queryHost();
          })
      }
      .id('id_security_cleartext_host_input_row')
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Row({ space: 8 }) {
        Button(HOST_ALLOWED_SAMPLE)
          .id('id_security_cleartext_host_example')
          .layoutWeight(1)
          .height(CHIP_HEIGHT)
          .fontSize(FONT_HINT)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(CHIP_HEIGHT)
          .padding({ left: CHIP_PADDING, right: CHIP_PADDING })
          .onClick(() => {
            // Fill the allowed sample host and query it immediately.
            this.vm.hostInput = HOST_ALLOWED_SAMPLE;
            this.vm.queryHost();
          })
        Button(HOST_DENIED_SAMPLE)
          .id('id_security_cleartext_host_iana')
          .layoutWeight(1)
          .height(CHIP_HEIGHT)
          .fontSize(FONT_HINT)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(CHIP_HEIGHT)
          .padding({ left: CHIP_PADDING, right: CHIP_PADDING })
          .onClick(() => {
            // Fill the denied sample host and query it immediately.
            this.vm.hostInput = HOST_DENIED_SAMPLE;
            this.vm.queryHost();
          })
      }
      .id('id_security_cleartext_host_chips')
      .width('100%')

      InfoRow({
        idPrefix: 'id_security_cleartext_host_name',
        label: $r('app.string.ns_sec_cleartext_host_name'),
        value: this.metaText(this.vm.cleartext.host)
      })
      InfoRow({
        idPrefix: 'id_security_cleartext_host',
        label: $r('app.string.ns_sec_cleartext_host_label'),
        value: this.vm.cleartext.host.length > DASH_TEXT_LENGTH ?
          (this.vm.cleartext.hostAllowed ? $r('app.string.ns_common_allowed') : $r('app.string.ns_common_denied')) :
          $r('app.string.ns_common_dash'),
        valueColor: this.vm.cleartext.host.length > DASH_TEXT_LENGTH ?
          this.allowedColor(this.vm.cleartext.hostAllowed) : $r('app.color.text_tertiary')
      })
    }
    .id('id_security_cleartext_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the HTTP probe card body with the allowed and denied probe actions.
   */
  @Builder
  probeContent() {
    Column({ space: 12 }) {
      Row({ space: 8 }) {
        Button($r('app.string.ns_sec_probe_allowed_btn'))
          .id('id_security_probe_allowed')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Probe an HTTP endpoint that the cleartext policy allows.
            this.vm.probeAllowed();
          })
        Button($r('app.string.ns_sec_probe_denied_btn'))
          .id('id_security_probe_denied')
          .layoutWeight(1)
          .height($r('app.float.control_height'))
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            // Probe an HTTP endpoint that the cleartext policy denies.
            this.vm.probeDenied();
          })
      }
      .id('id_security_probe_actions')
      .width('100%')

      // Show a placeholder while no probe has been executed yet.
      if (this.vm.probeResults.length === 0) {
        Text($r('app.string.ns_common_none'))
          .id('id_security_probe_empty')
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      } else {
        Column({ space: 8 }) {
          Repeat<HttpProbeResult>(this.vm.probeResults)
            .each((repeatItem: RepeatItem<HttpProbeResult>) => {
              Column({ space: 4 }) {
                Text(repeatItem.item.url)
                  .id('id_security_probe_url_' + repeatItem.index.toString())
                  .fontSize(FONT_LABEL)
                  .fontColor($r('app.color.text_primary'))
                  .maxLines(MAX_LINES)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
                Row({ space: 8 }) {
                  Text(this.probeHeadline(repeatItem.item))
                    .id('id_security_probe_code_' + repeatItem.index.toString())
                    .fontSize(FONT_HINT)
                    .fontColor(this.allowedColor(repeatItem.item.success))
                  Blank()
                    .id('id_security_probe_blank_' + repeatItem.index.toString())
                  Text(repeatItem.item.elapsedMs.toString() + ' ms')
                    .id('id_security_probe_elapsed_' + repeatItem.index.toString())
                    .fontSize(FONT_HINT)
                    .fontColor($r('app.color.text_tertiary'))
                }
                .id('id_security_probe_meta_' + repeatItem.index.toString())
                .width('100%')
                Text(repeatItem.item.message)
                  .id('id_security_probe_message_' + repeatItem.index.toString())
                  .fontSize(FONT_HINT)
                  .fontColor($r('app.color.text_secondary'))
                  .lineHeight(LINE_HEIGHT_HINT)
                  .maxLines(HINT_MAX_LINES)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
              }
              .id('id_security_probe_item_' + repeatItem.index.toString())
              .width('100%')
              .padding(ITEM_PADDING)
              .borderRadius(ITEM_RADIUS)
              .backgroundColor($r('app.color.fill_subtle'))
              .alignItems(HorizontalAlign.Start)
            })
            .key((item: HttpProbeResult, index: number) => index.toString())
        }
        .id('id_security_probe_list')
        .width('100%')
      }
    }
    .id('id_security_probe_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the error explanation card body for the latest failure.
   */
  @Builder
  errorContent() {
    Column({ space: 8 }) {
      // Render the explain block only when the latest verification failed.
      if (this.hasFailure()) {
        Column({ space: 6 }) {
          Row({ space: 8 }) {
            Text(this.vm.lastResult.code.toString())
              .id('id_security_error_code')
              .fontSize(FONT_LABEL)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.levelColor(this.explain().level))
            Text(this.explain().title)
              .id('id_security_error_explain_title')
              .fontSize(FONT_LABEL)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.levelColor(this.explain().level))
              .layoutWeight(1)
          }
          .id('id_security_error_title_row')
          .width('100%')
          Text(this.explain().reason)
            .id('id_security_error_reason')
            .fontSize(FONT_HINT)
            .fontColor($r('app.color.text_secondary'))
            .lineHeight(LINE_HEIGHT_HINT)
            .width('100%')
          Text(this.explain().suggestion)
            .id('id_security_error_suggestion')
            .fontSize(FONT_HINT)
            .fontColor($r('app.color.text_tertiary'))
            .lineHeight(LINE_HEIGHT_HINT)
            .width('100%')
        }
        .id('id_security_error_block')
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      } else {
        Text($r('app.string.ns_common_none'))
          .id('id_security_error_empty')
          .fontSize(FONT_LABEL)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
          .padding({ top: 8, bottom: 8 })
      }
    }
    .id('id_security_error_content')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * Build the scrollable page with all demo sections and the shared log panel.
   */
  build() {
    Scroll() {
      Column({ space: 12 }) {
        SectionCard({
          idPrefix: 'id_security_intro',
          title: $r('app.string.ns_sec_intro_title'),
          subtitle: $r('app.string.ns_sec_intro_desc')
        }) {
          this.introContent()
        }

        SectionCard({
          idPrefix: 'id_security_env',
          title: $r('app.string.ns_sec_section_env_title'),
          subtitle: $r('app.string.ns_sec_section_env_desc')
        }) {
          this.environmentContent()
        }

        SectionCard({
          idPrefix: 'id_security_cert',
          title: $r('app.string.ns_sec_section_cert_title'),
          subtitle: $r('app.string.ns_sec_section_cert_desc')
        }) {
          this.certContent()
        }

        SectionCard({
          idPrefix: 'id_security_cleartext',
          title: $r('app.string.ns_sec_section_cleartext_title'),
          subtitle: $r('app.string.ns_sec_section_cleartext_desc')
        }) {
          this.cleartextContent()
        }

        SectionCard({
          idPrefix: 'id_security_probe',
          title: $r('app.string.ns_sec_section_probe_title'),
          subtitle: $r('app.string.ns_sec_section_probe_desc')
        }) {
          this.probeContent()
        }

        SectionCard({
          idPrefix: 'id_security_error',
          title: $r('app.string.ns_sec_section_error_title'),
          subtitle: $r('app.string.ns_sec_section_error_desc')
        }) {
          this.errorContent()
        }

        LogPanel({
          idPrefix: 'id_security_log',
          logs: this.vm.logs,
          onClear: () => {
            // Clear the log list through the view model.
            this.vm.clearLogs();
          }
        })
      }
      .id('id_security_content')
      .width('100%')
      .padding(16)
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.page_bg'))
    }
    .id('id_security_page')
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .backgroundColor($r('app.color.page_bg'))
  }
}
