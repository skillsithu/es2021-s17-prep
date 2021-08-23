/**
 * JavaScript - ASCII Art Editor
 *
 * Your task is to implement all methods marked with @todo. You must not change any other method.
 * You may add as many methods to the ASCIIArtEditor class as you want.
 */


/**
 * Constructor function to create a new ASCIIArtEditor
 * @constructor
 */
var ASCIIArtEditor = function () {
    /**
     * When transforming images this property should be used as line
     * separator for all operations
     * @type {string}
     */
    this.lineSeperator = '\n';
};


/**
 * This function takes an arbitrary ASCII Art string as input and must
 * return a mirrored version of the given image.
 *
 * It should be possible to choose the mirror-axis with the second argument.
 *
 * The function should use the configured lineSeparator property on
 * the ASCIIArtEditor object.
 *
 * Example on 'x' axis:
 *   Input:                 Output:
 *     # --····-- $           # --====-- $
 *     #  +    -  $           #  +    -  $
 *     # --====-- $           # --····-- $
 *
 * Example on 'y' axis:
 *   Input:                 Output:
 *     # --····-- $           $ --····-- #
 *     #  +    -  $           $  -    +  #
 *     # --====-- $           $ --====-- #
 *
 * @param {string} image - the source image
 * @param {'x'|'y'} [axis='y'] - the axis to be used for the mirror operation, defaults to 'y'
 * @return string - the mirrored input image
 *
 * @throws Error - If an invalid axis was provided
 */
ASCIIArtEditor.prototype.mirror = function (image, axis = 'y') {
    const lines = image.split(this.lineSeperator);
    if (axis === 'y') {
        return lines.map(line => line.split('').reverse().join('')).join(this.lineSeperator);
    } else if (axis === 'x') {
        return lines.reverse().join(this.lineSeperator);
    } else {
        throw new Error('Invalid axis');
    }
};


/**
 * Takes any SQUARE ASCII image and must rotate the image by the
 * given angle (only multiple of 90 allowed).
 *
 * The rotation should always be clockwise.
 *
 * Example:
 *   Input:    90deg:    180deg:    270deg:    360deg:
 *     #-*       $-#       *-$        ***         #-*
 *     --*       ---       *--        ---         --*
 *     $-*       ***       *-#        #-$         $-*
 *
 * @param {string} image
 * @param {number} angle, has to be one of 0, 90, 180, 270, 360
 * @return string
 *
 * @throws Error - If an invalid angle was provided
 */
ASCIIArtEditor.prototype.rotate = function (image, angle) {
    const _editor = new ASCIIArtEditor();

    const _rotate = () => {
        const lines = image.split(this.lineSeperator);
        const copy = [];

        lines.forEach((line, x) => {
            const chars = line.split('');
            chars.forEach((char, y) => {
                if (!copy[y]) copy[y] = [];
                copy[y][x] = char;
            });
        });

        return copy.map(line => line.join('')).join(this.lineSeperator);
    };

    switch (angle) {
        case "0":
        case "360":
            return image;
        case "90":
            return _editor.mirror(_rotate());
        case "180":
            return _editor.mirror(_editor.mirror(image, 'y'), 'x');
        case "270":
            return _editor.mirror(_rotate(), 'x');
        default:
            throw new Error('Invalid angle');
    }
};
