export const getData = (el, data) => {
    try {
      return JSON.parse(el.dataset[camelize(data)]);
    } catch (e) {
      return el.dataset[camelize(data)];
    }
  };
  const camelize = (str) => {
    const text = str.replace(/[-_\s.]+(.)?/g, (_, c) =>
      c ? c.toUpperCase() : ""
    );
    return `${text.substr(0, 1).toLowerCase()}${text.substr(1)}`;
  };
  const utils = {
    getData
  }

  export default utils;