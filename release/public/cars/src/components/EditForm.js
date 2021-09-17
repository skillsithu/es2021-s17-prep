import { useState } from "react";

const fields = [{
    label: 'Title',
    name: 'title',
    type: 'text'
}, {
    label: 'Manufacturer',
    name: 'make',
    type: 'text'
}, {
    label: 'Model',
    name: 'model',
    type: 'text'
}, {
    label: 'Model Variant',
    name: 'modelVariant',
    type: 'text'
}, {
    label: 'Price',
    name: 'price',
    type: 'number'
}, {
    label: 'Fuel Type',
    name: 'fuelType',
    type: 'text'
}, {
    label: 'Year and Month',
    name: 'yearMonth',
    type: 'text'
}, {
    label: 'Engine Size',
    name: 'engineSize',
    type: 'number'
}, {
    label: 'Engine Power',
    name: 'enginePower',
    type: 'number'
}, {
    label: 'Engine Power Bhp',
    name: 'enginePowerBhp',
    type: 'number'
}, {
    label: 'Mile Age',
    name: 'mileAge',
    type: 'number'
}, {
    label: 'Image filename',
    name: 'image',
    type: 'text'
}];

const defaultValues = fields.reduce((acc, { name }) => { acc[name] = ""; return acc }, {});

export function EditForm({ carToEdit, close }) {
    const [values, setValues] = useState(carToEdit || defaultValues);

    const updateValue = (value, field) => {
        setValues({
            ...values,
            [field]: value
        })
    }

    const save = (event) => {
        event.preventDefault()
        event.stopPropagation()

        close({
            ...carToEdit,
            ...values
        })
    }

    return <div className="position-fixed fixed-top m-5 p-3 bg-white shadow-sm">
        <div className="d-flex align-items-center justify-content-between">
            <h3>{carToEdit ? 'Edit Car' : 'New Car'}</h3>
            <button type="button" className="btn btn-secondary" onClick={() => close()}>X</button>
        </div>
        <form onSubmit={save}>
            <div className="row">
                {fields.map(field => <div className="form-group col-3" key={field.name}>
                    <label htmlFor={field.name}>{field.label}</label>
                    <input type={field.type} className="form-control" id={field.name} required
                        value={values[field.name]} onChange={e => updateValue(e.target.value, field.name)} />
                </div>)}
            </div>
            <div className="mt-3">
                <button type="submit" className="btn btn-primary mr-3">Save</button>
                <button type="button" className="btn btn-secondary" onClick={() => close()}>Cancel</button>
            </div>
        </form>
    </div>
}