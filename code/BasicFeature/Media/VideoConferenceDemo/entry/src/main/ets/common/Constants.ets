import { audio } from '@kit.AudioKit';

export default class Constants {
  public static readonly DOMAIN: number = 0xFF00;
  public static readonly SUB_WINDOW_NAME: string = 'subwindow';
  public static readonly SUB_WINDOW_WIDTH: number = 402;
  public static readonly SUB_WINDOW_HEIGHT: number = 536;
  public static readonly RENDERER_INFO: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
    rendererFlags: 0
  };
}