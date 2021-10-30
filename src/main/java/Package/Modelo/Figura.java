package Package.Modelo;





public class Figura {
    private Integer figuraId;
    private String tipoFigura;
    private String nombreFigura;
    private Integer grandor;
    private Integer coordX;
    private Integer CoordY;
    private String colorFondo;
    private String colorBorde;
    private Integer usuarioID;


    public Figura() {
    }

    public Integer getFiguraId() {
        return figuraId;
    }

    public void setFiguraId(Integer figuraId) {
        this.figuraId = figuraId;
    }

    public String getTipoFigura() {
        return tipoFigura;
    }

    public void setTipoFigura(String tipoFigura) {
        this.tipoFigura = tipoFigura;
    }

    public String getNombreFigura() {
        return nombreFigura;
    }

    public void setNombreFigura(String nombreFigura) {
        this.nombreFigura = nombreFigura;
    }

    public Integer getGrandor() {
        return grandor;
    }

    public void setGrandor(Integer grandor) {
        this.grandor = grandor;
    }

    public Integer getCoordX() {
        return coordX;
    }

    public void setCoordX(Integer coordX) {
        this.coordX = coordX;
    }

    public Integer getCoordY() {
        return CoordY;
    }

    public void setCoordY(Integer coordY) {
        CoordY = coordY;
    }

    public String getColorFondo() {
        return colorFondo;
    }

    public void setColorFondo(String colorFondo) {
        this.colorFondo = colorFondo;
    }

    public String getColorBorde() {
        return colorBorde;
    }

    public void setColorBorde(String colorBorde) {
        this.colorBorde = colorBorde;
    }

    public Integer getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(Integer usuarioID) {
        this.usuarioID = usuarioID;
    }
}

