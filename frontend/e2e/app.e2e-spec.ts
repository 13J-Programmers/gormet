import { GourmetPage } from './app.po';

describe('gourmet App', () => {
  let page: GourmetPage;

  beforeEach(() => {
    page = new GourmetPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
