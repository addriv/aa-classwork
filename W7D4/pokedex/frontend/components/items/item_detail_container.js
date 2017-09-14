import { connect } from 'react-redux';
import ItemDetail from './item_detail';

export const mapStateToProps = state => ({
  items: state.entities.items
});

export default connect(mapStateToProps)(ItemDetail);
