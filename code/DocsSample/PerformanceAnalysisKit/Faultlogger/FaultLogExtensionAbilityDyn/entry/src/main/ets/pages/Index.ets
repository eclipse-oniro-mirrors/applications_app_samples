// [Start fault_log_extension_arkts_dyn_code_free]
@Entry
@Component
struct Index {
  build() {
    Button("AppInput")
      .onClick(() => {
        let t = Date.now();
        while (Date.now() - t <= 15000) {}
      })
  }
}
// [End fault_log_extension_arkts_dyn_code_free]
